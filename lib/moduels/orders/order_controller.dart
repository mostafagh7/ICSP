import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderController extends GetxController {
  FirebaseDatabase database = FirebaseDatabase.instance;
  var orderList = <dynamic>{}.obs;
  var isLoading = false.obs;
  getOrder() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phoneNumbers = prefs.getString("phoneNumber");
    isLoading.value = true;
    final ref = database.ref("users").child(phoneNumbers.toString()).child("orders");
    final snapshot = await ref.get();
    if (snapshot.value != null) {
      Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      data.forEach((key, value) {
        if (value is Map  ) {
          orderList.add(value["items"]);
          print(orderList);
        }
      });
      isLoading.value = false;
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    getOrder();
    super.onInit();
  }
}
