import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class CarsController extends GetxController {
  late FirebaseDatabase database = FirebaseDatabase.instance;
  var isloading = false.obs;
  var carsList = [].obs;
  List<String> displayedNames = [];

  getcars() async {
    isloading.value = true;
    final ref = database.ref("carbrand");
    final snapshot = await ref.get();
    if (snapshot.value != null) {
      Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      data.forEach((key, value) {
        carsList.add(value);
      });
      isloading.value = false;
    }
  }

  @override
  void onInit() {
    getcars();
    super.onInit();
  }
}
