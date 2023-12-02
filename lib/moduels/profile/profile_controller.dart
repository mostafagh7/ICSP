// ignore_for_file: avoid_print

 import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  late FirebaseDatabase database = FirebaseDatabase.instance;
  Rx<TextEditingController> nameController = TextEditingController().obs;
   Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> governorateController = TextEditingController().obs;
  Rx<TextEditingController> carbrandController = TextEditingController().obs;
  Rx<TextEditingController> carmodelController = TextEditingController().obs;
  var username = "".obs;
  var phoneNumber = "".obs;
  var address = "".obs;
  var governorate = "".obs;
  var carbrand = "".obs;
  var carmodel = "".obs;
  var isEditingName = false.obs;
  var isEditingphone = false.obs;
  var isEditingaddress = false.obs;
  var isEditinggovernorate = false.obs;
  var isEditingcarbrand = false.obs;
  var isEditingcarmodel = false.obs;
  var isLoading = false.obs;

  cuttrntUser() async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phoneNumbers = prefs.getString("phoneNumber");
    final ref = database.ref("users");
    final snapshot = await ref.get();
    if (snapshot.value != null) {
      Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      data.forEach((key, value) {
        if (value is Map && value.containsValue(phoneNumbers.toString())) {
          username.value = value["name"];
          phoneNumber.value = value["phone"];
          address.value = value["address"];
          carbrand.value = value["carbrand"];
          carmodel.value = value["carmodel"];
          governorate.value = value["governorate"];
        }
      });
      print("object");
       isLoading.value = false;
    }
   
  }

  changeName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phoneNumbers = prefs.getString("phoneNumber");
    try {
      await database
          .ref("users")
          .child(phoneNumbers.toString())
          .child("name")
          .set(nameController.value.text);
          onInit();
    } catch (e) {
      print(e);
    }
  }
  changeAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phoneNumbers = prefs.getString("phoneNumber");
    try {
      await database
          .ref("users")
          .child(phoneNumbers.toString())
          .child("address")
          .set(addressController.value.text);
          onInit();
    } catch (e) {
      print(e);
    }
  }
 
  changeGovernorate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phoneNumbers = prefs.getString("phoneNumber");
    try {
      await database
          .ref("users")
          .child(phoneNumbers.toString())
          .child("governorate")
          .set(governorateController.value.text);
          onInit();
    } catch (e) {
      print(e);
    }
  }
  changeCarBrand() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phoneNumbers = prefs.getString("phoneNumber");
    try {
      await database
          .ref("users")
          .child(phoneNumbers.toString())
          .child("carbrand")
          .set(carbrandController.value.text);
          onInit();
    } catch (e) {
      print(e);
    }
  }
  changeCarModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phoneNumbers = prefs.getString("phoneNumber");
    try {
      await database
          .ref("users")
          .child(phoneNumbers.toString())
          .child("carmodel")
          .set(carmodelController.value.text);
          onInit();
    } catch (e) {
      print(e);
    }
  }
 

  @override
  void onInit() {
    cuttrntUser();
    super.onInit();
  }
}
