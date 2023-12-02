import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  late FirebaseDatabase database = FirebaseDatabase.instance;
  Rx<TextEditingController> phonecontroller = TextEditingController().obs;
  Rx<TextEditingController> passcontroller = TextEditingController().obs;
  Rx<TextEditingController> confirmPasscontroller = TextEditingController().obs;
  Rx<TextEditingController> namecontroller = TextEditingController().obs;
  Rx<TextEditingController> addresscontroller = TextEditingController().obs;
  Rx<TextEditingController> codecontroller = TextEditingController().obs;
  RxString selectedCarBrand = "select_car".obs;
  RxString selectedItemModel = "select_model".obs;
  var selectedgovernorate = "select_governorate".obs;
  var isloading = false.obs;

  var governorate = [
    "Baghdad",
    "Basra",
    "Al-Muthanna",
    "Dhi Qar",
    "Wasit",
    "Maysan",
    "Al-Diwaniyah",
    "Karbala",
    "Najaf",
    "Babil",
    "Kirkuk",
    "Salahuddin",
    "Nineveh",
    "Duhok",
    "Erbil",
    "Sulaymaniyah"
  ].obs;
  var carBrandList = [].obs;
  var carSparesModel = <dynamic>{}.obs;
  var random = Random();
  var randomNumber = 000000;
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

  getCarSpares() async {
    final ref =
        database.ref("cars").child(selectedCarBrand.value.toLowerCase());
    final snapshot = await ref.get();
    if (snapshot.value != null) {
      Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      carSparesModel.clear();
      data.forEach((key, value) {
        if (value is Map && value.containsKey("model")) {
          carSparesModel.add(value["model"]);
        }
      });
    }
  }

  signup() async {
    isloading.value = true;
    final ref = database.ref("users");
    await ref.update({
      phonecontroller.value.text: {
        "information": {
          "phone": phonecontroller.value.text,
          "name": namecontroller.value.text,
          "address": addresscontroller.value.text,
          "pass": passcontroller.value.text,
          "code": randomNumber.toString(),
          "confirm": "NO",
          "governorate": selectedgovernorate.value.toString(),
          "carbrand": selectedCarBrand.value.toString(),
          "carmodel": selectedItemModel.value.toString(),
        }
      }
    });
    isloading.value = true;
  }

  check() async {
    if (namecontroller.value.text.isEmpty) {
      Get.snackbar("", "please enter the name");
    } else if (phonecontroller.value.text.isEmpty) {
      Get.snackbar("", "please enter the Phone Number");
    } else if (addresscontroller.value.text.isEmpty) {
      Get.snackbar("", "please enter the Address");
    } else if (passcontroller.value.text.isEmpty) {
      Get.snackbar("", "please enter the Password");
    } else if (confirmPasscontroller.value.text.isEmpty) {
      Get.snackbar("", "please Confirm Password");
    } else if (passcontroller.value.text != confirmPasscontroller.value.text) {
      Get.snackbar("", "Password Not Much");
    } else if (selectedgovernorate.value == "select_governorate") {
      Get.snackbar("", "please enter the governorate");
    } else if (passcontroller.value.text.length < 6 ||
        !RegExp(r'(?=.*[A-Za-z])(?=.*\d)')
            .hasMatch(passcontroller.value.text)) {
      Get.snackbar("",
          "Password must contain at least 6 characters and include letters and numbers'");
    } else {
      signup();
      Get.toNamed("confirmcode");
    }
  }

  @override
  void onInit() {
    randomNumber = random.nextInt(900000) + 100000;
    getcarbrand();
    super.onInit();
  }
}
