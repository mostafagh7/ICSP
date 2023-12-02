import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class CarsSpareController extends GetxController {
  late FirebaseDatabase database = FirebaseDatabase.instance;
  var carSpares = <dynamic>[].obs;
  var carSparesMainSystem = <dynamic>{}.obs;
  var carSparesModel = <dynamic>{}.obs;
  var carSparesBodyStyle = <dynamic>{}.obs;
  var carSparesFiltered = <dynamic>[].obs;
  String car = "";
  RxString selectedItemMainSystem = "select_main_system".obs;
  RxString selectedItemModel = "select_model".obs;
  RxString selectedItemBodyStyle = "select_Body_Style".obs;
  var isDataLoaded = false.obs;
  RxString selectedYear = "select_year".obs;
  RxList<String> availableYears = <String>[].obs;

  
  getCarSpares() async {
    if (isDataLoaded.value) return;
    final ref = database.ref("cars").child(car.toLowerCase());
    final snapshot = await ref.get();
    if (snapshot.value != null) {
      Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      carSpares.clear();
      carSparesMainSystem.clear();
      carSparesModel.clear();
      carSparesBodyStyle.clear();
      availableYears.clear();
      data.forEach((key, value) {
        carSpares.add(value);
        if (value is Map && value.containsKey("mainSystem")) {
          carSparesMainSystem.add(value["mainSystem"]);
        }
        if (value is Map && value.containsKey("model")) {
          carSparesModel.add(value["model"]);
        }
        if (value is Map && value.containsKey("bodystyle")) {
          carSparesBodyStyle.add(value["bodystyle"]);
        }
      if (value['year'] != null && value['year'] is List<dynamic>) {
  Set<String> uniqueYears = Set.from(value["year"].map((year) => year.toString()));
  availableYears.addAll(uniqueYears.toList());
}

      });
      availableYears.assignAll(availableYears.toSet().toList());
      availableYears.sort();
      isDataLoaded.value = true;
    }
  }

void filterCarSpares() {
   if (
    selectedItemMainSystem.value == "select_main_system" &&
    selectedItemModel.value == "select_model" &&
    selectedItemBodyStyle.value == "select_Body_Style" &&
    selectedYear.value == "select_year"
  ) {
    getCarSpares();
  }

  List<dynamic> filteredList = List.from(carSpares);

  if (selectedItemMainSystem.value != "select_main_system") {
    filteredList = filteredList
        .where((spare) =>
            spare["mainSystem"].toString() == selectedItemMainSystem.value)
        .toList();
  }

  if (selectedItemModel.value != "select_model") {
    filteredList = filteredList
        .where((spare) => spare["model"].toString() == selectedItemModel.value)
        .toList();
  }

  if (selectedItemBodyStyle.value != "select_Body_Style") {
    filteredList = filteredList
        .where((spare) =>
            spare["bodystyle"].toString() == selectedItemBodyStyle.value)
        .toList();
  }

  if (selectedYear.value != "select_year") {
    filteredList = filteredList.where((spare) {
      if (spare.containsKey("year") &&
          spare["year"].contains(selectedYear.value)) {
        return true;
      }
      return false;
    }).toList();
  }
  carSparesFiltered.value = filteredList;
}

}
