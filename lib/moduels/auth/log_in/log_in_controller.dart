 import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInController extends GetxController {
  late FirebaseDatabase database = FirebaseDatabase.instance;

  Rx<TextEditingController> phonecontroller = TextEditingController().obs;
  Rx<TextEditingController> passcontroller = TextEditingController().obs;

  var isLoading = false.obs;
  @override
  void onInit() {
    phonecontroller.value = TextEditingController();
    passcontroller.value = TextEditingController();
    super.onInit();
  }

  login() async {
    isLoading.value = true;
    final ref = database.ref("users").child(phonecontroller.value.text);
    final snapshot = await ref.get();

    bool isValidCredentials = false;

    if (snapshot.value != null) {
      Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      String phoneNumber = phonecontroller.value.text.trim();
      String password = passcontroller.value.text.trim();

      data.forEach((key, value) async {
        if (value is Map &&
            value.containsValue(phoneNumber) &&
            value.containsValue(password)) {
          isValidCredentials = true;
          Get.offAllNamed("splash");
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("phoneNumber", phoneNumber);
          prefs.setString("password", password);
          return;
        }
      });

      if (!isValidCredentials) {
        Get.snackbar("error", "Number or password not found");
      }
    }
    isLoading.value = false;
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phoneNumber = prefs.getString("phoneNumber");
    String? password = prefs.getString("password");
    if (phoneNumber != null && password != null) {
      Get.offAllNamed("splash");
    } else {
      Get.offAllNamed("login");
    }
  }
}
