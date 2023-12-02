import 'package:get/get.dart';

class DetailsProductController extends GetxController {
  var quantityCount = 0.obs;
  void decrementQuantity() {
    if (quantityCount.value > 0) {
      quantityCount.value--;
    }
  }

  void incrementQuantity() {
    quantityCount.value++;
  }
}
