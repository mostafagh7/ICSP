import 'package:e_commerce/Widget/colors.dart';
import 'package:e_commerce/moduels/cars/cars_controller.dart';
import 'package:e_commerce/moduels/cars_spare/cars_spare_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({super.key});

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  CarsController controllerCars = Get.find();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        title: const Text(
          "Cars",
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed("cart");
              },
              icon: const Icon(Icons.shopping_cart))
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(() {
            if (controllerCars.isloading.value == true) {
              return const Center(child: CircularProgressIndicator());
            }
            return Expanded(
                child: ListView.builder(
              itemCount: controllerCars.carsList.length,
              itemBuilder: (context, index) {
                String carBrand =
                    controllerCars.carsList[index]["carbrand"].toString();
                if (!controllerCars.displayedNames.contains(carBrand)) {
                  controllerCars.displayedNames.add(carBrand);
                  return ListTile(
                    onTap: () {
                      Get.to(CarsSpare(
                        car: controllerCars.carsList[index]["carbrand"],
                      ));
                    },
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      carBrand,
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: SizedBox(
                      width: 100,
                      height: 100,
                      child: controllerCars.carsList[index]["brandlogo"]
                                  .toString() ==
                              ""
                          ? Image.asset(
                              "assets/images/Disks.webp",
                              height: 100,
                              width: 100,
                            )
                          : Image.network(
                              controllerCars.carsList[index]["brandlogo"]
                                  .toString(),
                              height: 100,
                              width: 100,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: secondaryColor,
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  (loadingProgress
                                                          .expectedTotalBytes ??
                                                      1)
                                              : null,
                                    ),
                                  );
                                }
                              },
                            ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ));
          })
        ],
      ),
    );
  }
}
