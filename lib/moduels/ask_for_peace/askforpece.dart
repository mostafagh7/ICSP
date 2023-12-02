import 'package:e_commerce/Widget/buttonnew.dart';
import 'package:e_commerce/Widget/my_textfield.dart';
import 'package:e_commerce/moduels/auth/sign_up/sign_up_controller.dart';
import 'package:get/get.dart';

import '../../../Widget/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AskForPiece extends StatelessWidget {
  AskForPiece({super.key});
  SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        title: const Text(
          "Ask for a piece",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: Colors.grey[300],
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12, top: 12),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Car Data",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Obx(() {
                              if (controller.selectedCarBrand.value ==
                                  "select_car") {
                                return const Text(
                                  "",
                                  style: TextStyle(fontSize: 15),
                                );
                              }
                              return Text(
                                " ${controller.selectedCarBrand.value}",
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              );
                            })),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Obx(() {
                                  return DropdownButton(
                                    items: [
                                      const DropdownMenuItem(
                                          value: 'select_car',
                                          child: Text('Select Car')),
                                      ...controller.carBrandList
                                          .map((e) => DropdownMenuItem(
                                                value: e,
                                                child: Text(e),
                                              ))
                                          .toList(),
                                    ],
                                    onChanged: (val) {
                                      controller.selectedCarBrand.value =
                                          val.toString();
                                      controller.getCarSpares();
                                    },
                                    value: controller.selectedCarBrand.value,
                                  );
                                }))),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.grey[300],
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Parts Data",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Part Name or Number",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38),
                      ),
                    ),
                  ),
                  const MyTextField(
                       hintText: "enter name or number of peace ",
                      numberorText: false),
                  const SizedBox(
                    height: 10,
                  ),
                  const MyButtonNew(text: "upload image", icon: Icons.image),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                      Container(
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(child: Text("1"))),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.remove)),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(() {
                        if (controller.selectedgovernorate.value ==
                            "select_governorate") {
                          return const Text(
                            "",
                            style: TextStyle(fontSize: 15),
                          );
                        }
                        return Text(
                          " ${controller.selectedgovernorate.value}",
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        );
                      })),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(() {
                        return DropdownButton(
                          items: [
                            const DropdownMenuItem(
                                value: 'select_governorate',
                                child: Text('Select Governorate')),
                            ...controller.governorate
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                          ],
                          onChanged: (val) {
                            controller.selectedgovernorate.value =
                                val.toString();
                          },
                          value: controller.selectedgovernorate.value,
                        );
                      }))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.grey[300],
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Add Comments",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextField(
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(50),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.grey[300],
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Promocode",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          width: 250, // تحديد عرض محدد هنا
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: "Enter Promo Code",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(20),
                            child: const Text(
                              "Add",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
                padding: EdgeInsets.all(8.0),
                child:
                    MyButtonNew(text: "Order Pricing", icon: Icons.price_check))
          ],
        ),
      ),
    );
  }
}
