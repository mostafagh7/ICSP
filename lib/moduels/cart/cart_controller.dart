import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  late FirebaseDatabase database = FirebaseDatabase.instance;

  RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;
  int existingIndex = 0;
  double totalPrice = 0.0;
  var isLoading = false;

  void addToCart(Map<String, dynamic> product, int quantityCount) {
    existingIndex = cartItems
        .indexWhere((item) => item["productId"] == product["productId"]);
    if (existingIndex != -1) {
      cartItems[existingIndex]["quantity"] += quantityCount;
    } else {
      product["quantity"] = quantityCount;
      cartItems.add(product);
    }
  }

  void removeFromCart(int index) {
    cartItems.removeAt(index);
    totalPrice = 0;
    update();
  }

  void decrementQuantity(int index) {
    cartItems[index]["quantity"] = cartItems[index]["quantity"] - 1;
    update();
  }

  void incrementQuantity(int index) {
    cartItems[index]["quantity"] = cartItems[index]["quantity"] + 1;
    update();
  }

double calculateTotalPrice() {
  totalPrice = 0.0;  
  for (var item in cartItems) {
    double itemPrice = double.parse(item["price"]);
    int quantity = item["quantity"];
    totalPrice += itemPrice * quantity;
  }
  return totalPrice;
}


 sendOrder() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? phoneNumbers = prefs.getString("phoneNumber");
  isLoading = true;
  update();

  final ref = database.ref("users").child(phoneNumbers.toString()).child("orders");

  Map<String, dynamic> orderItems = {};

  for (var item in cartItems) {
    orderItems.addAll({
      "sparename": item["sparename"],
      "model": item["model"],
      "quantity": item["quantity"],
      "price": item["price"],
      "pic": item["pic"],
      "timestamp": DateTime.now().toString(),
      "totalPrice": totalPrice,
    });
  }

  await ref.push().set({
    "items": orderItems,
    "totalPrice": calculateTotalPrice().toString(),
    "timestamp": DateTime.now().toString(),
  });

  cartItems.clear();
  totalPrice = 0;
  isLoading = false;
  update();
}

}
