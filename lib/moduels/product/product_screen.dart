import 'package:e_commerce/Widget/drawer.dart';
import 'package:e_commerce/moduels/home/home_controller.dart';

import '../../../Widget/card.dart';
import '../../../Widget/button.dart';
import '../../../Widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  HomeScreenController homecontroller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        title: const Text(
          "Home",
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
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //promo message
                      Text(
                        "Get 32% promo",
                        style: GoogleFonts.dmSerifDisplay(
                            fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //redeem button
                      MyButton(
                        text: "Redeem",
                        onTap: () {},
                        width: 150,
                        height: 75,
                      )
                    ],
                  ),
                  //image
                  Image.asset(
                    "assets/images/Disks.webp",
                    height: 120,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                    child: MyCard(
                  text: "Category",
                  onTap: () {
                    Get.toNamed("/category");
                  },
                  animation: "assets/json/category1.json",
                )),
                Expanded(
                    child: MyCard(
                  text: "Ask for a piece ",
                  onTap: () {
                    Get.toNamed("/ask");
                  },
                  animation: "assets/json/ask.json",
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: MyCard(
                    height: 150,
                    text: "Search",
                    onTap: () {
                      homecontroller.currentIndex.value = 1;
                      homecontroller.tiggerSearch.change(true);
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          homecontroller.tiggerSearch.change(false);
                        },
                      );
                      
                    },
                    animation: "assets/json/search.json",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
