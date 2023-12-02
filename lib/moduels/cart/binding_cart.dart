 import 'package:e_commerce/moduels/cart/cart_controller.dart';
  import 'package:get/get.dart';

class BindingCart implements Bindings {
  @override
  void dependencies() {
    Get.put(CartController(),permanent: true);
  }
}
