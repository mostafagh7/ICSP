import 'package:e_commerce/moduels/auth/sign_up/sign_up_controller.dart';
import 'package:get/get.dart';

class BindingSignUP implements Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}
