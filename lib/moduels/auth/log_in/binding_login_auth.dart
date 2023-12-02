import 'package:e_commerce/moduels/auth/log_in/log_in_controller.dart';
import 'package:get/get.dart';

class BindingLogIn implements Bindings {
  @override
  void dependencies() {
    Get.put(LogInController(), permanent: true);
  }
}
