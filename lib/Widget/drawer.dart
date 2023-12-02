import 'package:e_commerce/Widget/my_list_tile.dart';
import 'package:e_commerce/moduels/home/home_controller.dart';
import 'package:e_commerce/moduels/orders/order_screen.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    HomeScreenController homecontroller = Get.find<HomeScreenController>();

    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const DrawerHeader(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 46,
                ),
              ),
              MyListTile(
                icon: Icons.home,
                text: "H O M E",
                onTap: () {
                  Navigator.pop(context);
                  homecontroller.currentIndex.value = 0;
                   homecontroller.tiggerHome.change(true);
                          Future.delayed(
                            const Duration(seconds: 1),
                            () {
                              homecontroller.tiggerHome.change(false);
                            },
                          );
                },
              ),
              MyListTile(
                icon: Icons.person,
                text: "P R O F I L E",
                onTap: () {
                  Navigator.pop(context);
                  homecontroller.currentIndex.value = 2;
                     homecontroller.tiggerProfile.change(true);
                          Future.delayed(
                            const Duration(seconds: 1),
                            () {
                              homecontroller.tiggerProfile.change(false);
                            },
                          );
                },
              ),
              MyListTile(
                icon: Icons.shopping_bag_outlined,
                text: "M Y   O R D E R S",
                onTap: () {
                  Get.to(()=>const OrderScreen());
                 },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              icon: Icons.logout,
              text: "L O G O U T",
              onTap: () async {
                Get.offAllNamed("login");
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove("phoneNumber");
                prefs.remove("password");
              },
            ),
          ),
        ],
      ),
    );
  }
}
