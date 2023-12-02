// ignore_for_file: invalid_use_of_protected_member

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchControllerPage extends GetxController {
  var isloading = false.obs;
  var dataList = [].obs;
  var carBrandList = [].obs;
  var selectedCarBrand = "TOYOTA".obs;
  late FirebaseDatabase database = FirebaseDatabase.instance;
  TextEditingController searchController = TextEditingController();

 void search() {
  isloading.value = true;
  var searchTerm = searchController.text.toLowerCase();
  if (searchTerm.isEmpty) {
    dataList.value.clear();
    isloading.value = false;
  } else {
    database
        .ref("cars")
        .child(selectedCarBrand.value.toLowerCase())
        .once()
        .then((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> values =
            event.snapshot.value as Map<dynamic, dynamic>;
        dataList.value.clear();
        values.forEach((key, value) {
          if (value['tags'] != null && value['tags'] is List<dynamic>) {
             bool containsSearchTerm = value['tags'].any(
                (tag) => tag.toString().toLowerCase().contains(searchTerm));
            if (containsSearchTerm) {
              dataList.value.add(value);
            }
          }
        });
      }
      isloading.value = false;
    });
  }
}


  getcarbrand() async {
    final ref = database.ref("carbrand");
    final snapshot = await ref.get();
    if (snapshot.value != null) {
      Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      data.forEach((key, value) {
        if (value is Map && value.containsKey("carbrand")) {
          carBrandList.add(value["carbrand"]);
        }
      });
    }
  }

  @override
  void onInit() {
    getcarbrand();
    super.onInit();
  }
}
