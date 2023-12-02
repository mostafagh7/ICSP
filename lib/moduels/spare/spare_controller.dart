// import 'package:firebase_database/firebase_database.dart';
// import 'package:get/get.dart';

// class SpareController extends GetxController {
//   FirebaseDatabase database = FirebaseDatabase.instance;
//   var engineCoolingSystem = [].obs;
//   getSpare() async {
//     final ref = database.ref("cars");
//     final snapshot = await ref.get();
//     if (snapshot.value != null) {
//        Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
//       data.forEach((key, value) {
//         if (value is Map && value.containsKey("mainSystem")) {
//            engineCoolingSystem.add(value);
//          }
//       });
//     }
//   }

//   @override
//   void onInit() {
//     getSpare();
//     super.onInit();
//   }
// }
