import 'package:e_commerce/moduels/cars/cars_controller.dart';
import 'package:get/get.dart';

class BindingCars implements Bindings {
  @override
  void dependencies() {
    Get.put(CarsController());
  }
}
