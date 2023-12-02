import '../../../Widget/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Spare extends StatefulWidget {
  const Spare({super.key});

  @override
  State<Spare> createState() => _SpareState();
}

class _SpareState extends State<Spare> {
  // SpareController controller = Get.put(SpareController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: MyCard(
                        text: "Batteries",
                        onTap: () {
                          Get.toNamed("battaries");
                        },
                        image: 'assets/images/batter-removebg-preview.png')),
                Expanded(
                    child: MyCard(
                        text: "Disks",
                        onTap: () {
                          Get.toNamed("disks");
                        },
                        image: 'assets/images/Disks.webp')),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: MyCard(
                        text: "Tires",
                        onTap: () {
                          Get.toNamed("tires");
                        },
                        image: 'assets/images/R-removebg-preview.png')),
                Expanded(
                    child: MyCard(
                        text: "Oils",
                        onTap: () {
                          Get.toNamed("oils");
                        },
                        image:
                            'assets/images/istockphoto-184623095-170667a-removebg-preview.png')),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: MyCard(
                        text: "Chain",
                        onTap: () {
                          Get.toNamed("chain");
                        },
                        image: 'assets/images/CHAIN.png')),
                Expanded(
                    child: MyCard(
                        text: "Brakes",
                        onTap: () {
                          Get.toNamed("brakes");
                        },
                        image: 'assets/images/BRAKES.png')),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: MyCard(
                        text: "Engine",
                        onTap: () {
                          Get.toNamed("engine");
                        },
                        image: 'assets/images/ENGINE.png')),
                Expanded(
                    child: MyCard(
                        text: "Axle Suspesion",
                        onTap: () {
                          Get.toNamed("axle");
                        },
                        image: 'assets/images/AXLE-SUSPENSION.png')),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: MyCard(
                        text: "Body",
                        onTap: () {
                          Get.toNamed("body");
                        },
                        image: 'assets/images/BODY.png')),
                Expanded(
                    child: MyCard(
                        text: "Filters",
                        onTap: () {
                          Get.toNamed("filters");
                        },
                        image: 'assets/images/FILTERS.png')),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: MyCard(
                        text: "Damping",
                        onTap: () {},
                        image: 'assets/images/DAMPING.png')),
                Expanded(
                    child: MyCard(
                        text: "Windscreen Cleaning System",
                        onTap: () {
                          Get.toNamed("wind");
                        },
                        image: 'assets/images/WINDSCREEN-CLEANING-SYSTEM.png')),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: MyCard(
                        text: "All Product",
                        onTap: () {},
                        image: 'assets/images/OIP-removebg-preview.png')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
