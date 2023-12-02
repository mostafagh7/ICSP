 import 'package:e_commerce/moduels/cart/cart_controller.dart';
import 'package:e_commerce/moduels/details_porduct/details_product_controller.dart';
 import 'package:get/get.dart';

class BindingDetailsProduct implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailsProductController());
    Get.put(CartController(),permanent: true);
  }
}
