// ignore_for_file: invalid_use_of_protected_member

import 'package:e_commerce/Widget/drawer.dart';
import 'package:e_commerce/moduels/details_porduct/binding_details_product.dart';
import 'package:e_commerce/moduels/details_porduct/details_product_screen.dart';
import 'package:e_commerce/moduels/search/search_controller.dart';
import '../../../Widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  SearchControllerPage productcontroller = Get.put(SearchControllerPage());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        title: const Text(
          "Search",
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
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Please select the type of car you want to search for",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
              Obx(() {
                return DropdownButton(
                  items: productcontroller.carBrandList
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (val) {
                    productcontroller.selectedCarBrand.value = val.toString();
                  },
                  value: productcontroller.selectedCarBrand.value,
                );
              }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Search for a Piece",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    productcontroller.search();
                  },
                  controller: productcontroller.searchController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: secondaryColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                      hintText: "Search here ...",
                      prefixIcon: const Icon(Icons.search),
                      hintStyle: TextStyle(color: primaryColor),
                      prefixIconColor: primaryColor),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Obx(() {
            if (productcontroller.isloading.value == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return productcontroller.dataList.value.isEmpty
                ? const Center(
                    child: Text(
                    "Enter any keyword to search",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ))
                : Expanded(
                    child: ListView.builder(
                        itemCount: productcontroller.dataList.value.length,
                        itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                Get.to(
                                    ProductDetailsPage(
                                      product: productcontroller
                                          .dataList.value[index],
                                    ),
                                    binding: BindingDetailsProduct());
                              },
                              contentPadding: const EdgeInsets.all(8),
                              title: Text(
                                productcontroller
                                    .dataList.value[index]["sparename"]
                                    .toString(),
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "Main System: ${productcontroller.dataList.value[index]["mainSystem"].toString()}",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                "Model: ${productcontroller.dataList.value[index]["model"].toString()}",
                                style: TextStyle(color: primaryColor),
                              ),
                              leading: SizedBox(
                                width: 100,
                                height: 100,
                                child: productcontroller
                                            .dataList.value[index]["pic"]
                                            .toString() ==
                                        ""
                                    ? Image.asset(
                                        "assets/images/Disks.webp",
                                        height: 100,
                                        width: 100,
                                      )
                                    : Image.network(
                                        productcontroller
                                            .dataList.value[index]["pic"]
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
                            )));
          })
        ],
      ),
    );
  }
}
