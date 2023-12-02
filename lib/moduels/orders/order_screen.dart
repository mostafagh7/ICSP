import 'package:e_commerce/Widget/colors.dart';
import 'package:e_commerce/moduels/orders/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController controller = Get.put(OrderController());
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Obx(() {
        if (controller.isLoading.value == true) {
          return const Center(
            child: GFLoader(
              type: GFLoaderType.android,
            ),
          );
        }
        if (controller.orderList.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "No order has been ordered",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed("category");
                },
                child: const Text(
                  "order now",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Image.asset("assets/images/no_data.png"),
              ),
            ],
          );
        }
        return Column(
          children: [
            Container(
              height: 230,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(50),
                  ),
                  color: secondaryColor),
              child: Stack(
                children: [
                  Positioned(
                      top: 80,
                      left: 0,
                      child: Container(
                        height: 100,
                        width: 300,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            )),
                      )),
                  Positioned(
                      top: 105,
                      left: 20,
                      child: Text(
                        "Your Orders",
                        style: TextStyle(
                            fontSize: 30,
                            color: secondaryColor,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: controller.orderList.length,
                    itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.only(bottom: 10, top: 25),
                          height: 250,
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(80)),
                                boxShadow: [
                                  BoxShadow(
                                      color: secondaryColor.withOpacity(0.3),
                                      offset: const Offset(-10.0, 0.0),
                                      blurRadius: 20.0,
                                      spreadRadius: 4.0)
                                ]),
                            padding: const EdgeInsets.only(
                                left: 32, top: 50.0, bottom: 50.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                 "Model: ${ controller.orderList
                                      .toList()[index]["model"]
                                      .toString()}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  controller.orderList
                                      .toList()[index]["sparename"]
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                 "Price: ${ controller.orderList
                                      .toList()[index]["totalPrice"]
                                      .toString()} IQD",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        )))
          ],
        );
      }),
    );
  }
}
