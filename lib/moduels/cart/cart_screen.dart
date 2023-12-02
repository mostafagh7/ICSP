import 'package:cool_alert/cool_alert.dart';
import 'package:e_commerce/Widget/buttonnew.dart';
import 'package:e_commerce/Widget/colors.dart';
import 'package:e_commerce/moduels/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey[800],
          elevation: 0,
          title: const Text(
            "cart",
          ),
          centerTitle: true,
        ),
        body: GetBuilder<CartController>(
          init: CartController(),
          builder: (controllercart) {
            if (controllercart.isLoading) {
              return const Center(
                child: GFLoader(
                  type: GFLoaderType.ios,
                ),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controllercart.cartItems.length,
                    itemBuilder: (context, index) => Card(
                      color: Colors.grey[500],
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(8),
                        subtitle: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: controllercart.cartItems[index]["pic"]
                                              .toString() ==
                                          ""
                                      ? Image.asset(
                                          "assets/images/Disks.webp",
                                          height: 100,
                                          width: 100,
                                        )
                                      : Image.network(
                                          controllercart.cartItems[index]["pic"]
                                              .toString(),
                                          height: 100,
                                          width: 100,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            } else {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controllercart.cartItems[index]
                                              ["sparename"]
                                          .toString(),
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Model: ${controllercart.cartItems[index]["model"].toString()}",
                                      style: TextStyle(color: primaryColor),
                                    ),
                                    Text(
                                      "Quantity: ${controllercart.cartItems[index]["quantity"].toString()}",
                                      style: TextStyle(color: primaryColor),
                                    ),
                                    Text(
                                      "Price: ${(double.parse(controllercart.cartItems[index]["price"]) * controllercart.cartItems[index]["quantity"]).toString()} IQD",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      CoolAlert.show(
                                        confirmBtnColor: secondaryColor,
                                        backgroundColor: primaryColor,
                                        context: context,
                                        type: CoolAlertType.confirm,
                                        text:
                                            "Are you sure you want to delete the product from the cart?",
                                        onConfirmBtnTap: () {
                                          controllercart.removeFromCart(index);
                                        },
                                      );
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: primaryColor,
                                      size: 35,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: secondaryColor,
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      if (controllercart.cartItems[index]
                                              ["quantity"] >
                                          1) {
                                        controllercart.decrementQuantity(index);
                                      } else {
                                        CoolAlert.show(
                                          confirmBtnColor: secondaryColor,
                                          context: context,
                                          type: CoolAlertType.confirm,
                                          backgroundColor: primaryColor,
                                          text:
                                              "Are you sure you want to delete the product from the cart?",
                                          onConfirmBtnTap: () {
                                            controllercart
                                                .removeFromCart(index);
                                          },
                                        );
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                  child: Center(
                                    child: Text(
                                      controllercart.cartItems[index]
                                              ["quantity"]
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: secondaryColor,
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      controllercart.incrementQuantity(index);
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(211, 160, 108, 104),
                    ),
                    width: double.infinity,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyButtonNew(
                            text: "Confirm Order",
                            onTap: () {
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.confirm,
                                text:
                                    "Are you sure you want to buy these products?",
                                onConfirmBtnTap: () {
                                  controllercart.sendOrder();
                                },
                              );
                            },
                            icon: Icons.attach_money,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Item Price",
                                style: TextStyle(
                                    color: Colors.white60,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Text(
                                "${controllercart.calculateTotalPrice().toStringAsFixed(2)} IQD",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
