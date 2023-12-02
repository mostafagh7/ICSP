import 'package:e_commerce/moduels/home/home_controller.dart';
import 'package:get/get.dart';

class BindingHome implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
  }
}
