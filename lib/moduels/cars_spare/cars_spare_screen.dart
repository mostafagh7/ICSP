import 'package:e_commerce/Widget/colors.dart';
import 'package:e_commerce/moduels/cars_spare/cars_spare_controller.dart';
import 'package:e_commerce/moduels/details_porduct/binding_details_product.dart';
import 'package:e_commerce/moduels/details_porduct/details_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CarsSpare extends StatelessWidget {
  final String car;
  const CarsSpare({
    super.key,
    required this.car,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey[800],
          elevation: 0,
          title: const Text(
            "Spare",
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
        body: GetX<CarsSpareController>(
            init: CarsSpareController(),
            builder: (controller) {
              controller.car = car;
              if (!controller.isDataLoaded.value) {
                controller.getCarSpares();
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              controller.filterCarSpares();
              return Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const Padding(padding: EdgeInsets.all(8)),
                        DropdownButton(
                          items: [
                            const DropdownMenuItem(
                                value: 'select_model',
                                child: Text('Select Model')),
                            ...controller.carSparesModel
                                .map((e) =>
                                    DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                          ],
                          onChanged: (v) {
                            controller.selectedItemModel.value = v.toString();
                            controller.filterCarSpares();
                          },
                          value: controller.selectedItemModel.value,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        DropdownButton(
                          items: [
                            const DropdownMenuItem(
                              value: 'select_year',
                              child: Text('Select Year'),
                            ),
                            ...controller.availableYears.map((e) {
                              return DropdownMenuItem(
                                value: e.toString(),
                                child: Text(e),
                              );
                            }).toList(),
                          ],
                          value: controller.selectedYear.value,
                          onChanged: (val) {
                            controller.selectedYear.value = val.toString();
                            controller.filterCarSpares();
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        DropdownButton(
                          items: [
                            const DropdownMenuItem(
                                value: 'select_main_system',
                                child: Text('Select Main System')),
                            ...controller.carSparesMainSystem
                                .map((e) =>
                                    DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                          ],
                          onChanged: (v) {
                            controller.selectedItemMainSystem.value =
                                v.toString();
                            controller.filterCarSpares();
                          },
                          value: controller.selectedItemMainSystem.value,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        DropdownButton(
                          items: [
                            const DropdownMenuItem(
                                value: 'select_Body_Style',
                                child: Text('Select Body Style')),
                            ...controller.carSparesBodyStyle
                                .map((e) =>
                                    DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                          ],
                          onChanged: (v) {
                            controller.selectedItemBodyStyle.value =
                                v.toString();
                            controller.filterCarSpares();
                          },
                          value: controller.selectedItemBodyStyle.value,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.carSparesFiltered.length,
                      itemBuilder: (context, index) => ListTile(
                        onTap: () {
                          Get.to(
                              ProductDetailsPage(
                                product: controller.carSparesFiltered[index],
                              ),
                              binding: BindingDetailsProduct());
                        },
                        contentPadding: const EdgeInsets.all(8),
                        title: Text(
                          controller.carSparesFiltered[index]["sparename"]
                              .toString(),
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "Main System: ${controller.carSparesFiltered[index]["mainSystem"].toString()}",
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Model: ${controller.carSparesFiltered[index]["model"].toString()}",
                              style: TextStyle(color: primaryColor),
                            ),
                            Text(
                              "Price: ${controller.carSparesFiltered[index]["price"].toString()} IQD",
                              style: TextStyle(color: primaryColor),
                            ),
                          ],
                        ),
                        leading: SizedBox(
                          width: 100,
                          height: 100,
                          child: controller.carSparesFiltered[index]["pic"]
                                      .toString() ==
                                  ""
                              ? Image.asset(
                                  "assets/images/Disks.webp",
                                  height: 100,
                                  width: 100,
                                )
                              : Image.network(
                                  controller.carSparesFiltered[index]["pic"]
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
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
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
                      ),
                    ),
                  ),
                ],
              );
            }));
  }
}
