import 'package:cool_alert/cool_alert.dart';
import 'package:e_commerce/moduels/cart/cart_controller.dart';
import 'package:e_commerce/moduels/details_porduct/details_product_controller.dart';
import 'package:get/get.dart';
import '../../../Widget/button.dart';
import '../../../Widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<dynamic, dynamic> product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  DetailsProductController controllerdetails =
      Get.find<DetailsProductController>();
  CartController controllercart = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey[800],
          elevation: 0,
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
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  widget.product["pic"].toString() == ""
                      ? Image.asset(
                          "assets/images/Disks.webp",
                          height: 200,
                        )
                      : Image.network(
                          widget.product["pic"],
                          height: 200,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: secondaryColor,
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          (loadingProgress.expectedTotalBytes ??
                                              1)
                                      : null,
                                ),
                              );
                            }
                          },
                        ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    widget.product['sparename'],
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "auhsdhkasdfjchduchsdjkchzdjk hafhs kajsfh ashf ajkdhsf uadhf adhf ajksdfh ui;adhf ad;hkf adhf kash;auhsdhkasdfjchduchsdjkchzdjk hafhs kajsfhauhsdhkasdfjchduchsdjkchzdjk hafhs kajsfhauhsdhkasdfjchduchsdjkchzdjk hafhs kajsfhd fausfh ",
                    style: TextStyle(
                        color: Colors.grey[600], fontSize: 14, height: 2),
                  )
                ],
              ),
            )),
            Container(
              padding: const EdgeInsets.all(25),
              color: primaryColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "IQD ${widget.product["price"]}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: secondaryColor, shape: BoxShape.circle),
                            child: IconButton(
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: controllerdetails.decrementQuantity,
                            ),
                          ),
                          Obx(() {
                            return SizedBox(
                              width: 40,
                              child: Center(
                                child: Text(
                                  controllerdetails.quantityCount.value
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          }),
                          Container(
                            decoration: BoxDecoration(
                                color: secondaryColor, shape: BoxShape.circle),
                            child: IconButton(
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: controllerdetails.incrementQuantity,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  MyButton(
                    text: "Add To Cart",
                    onTap: () {
                      if (controllerdetails.quantityCount.value == 0) {
                        CoolAlert.show(
                          confirmBtnColor: secondaryColor,
                          context: context,
                          type: CoolAlertType.warning,
                          text: "Please select the quantity you want",
                          backgroundColor: secondaryColor,
                        );
                      } else {
                        widget.product["productId"] = UniqueKey().toString();

                        controllercart.addToCart(
                          widget.product.cast<String, dynamic>(),
                          controllerdetails.quantityCount.value,
                        );

                        CoolAlert.show(
                          confirmBtnColor: secondaryColor,
                          context: context,
                          type: CoolAlertType.success,
                          text: "Added Successfully",
                          backgroundColor: primaryColor,
                        );
                      }
                    },
                    width: double.infinity,
                    height: 70,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
