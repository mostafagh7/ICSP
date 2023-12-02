import 'package:e_commerce/moduels/product/product_screen.dart';
import 'package:e_commerce/moduels/profile/profile_screen.dart';
import 'package:e_commerce/moduels/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class HomeScreenController extends GetxController {
  late SMIBool tiggerSearch;
  late SMIBool tiggerHome;
  late SMIBool tiggerProfile;
  var currentIndex = 0.obs;
  final List<Widget> pages = [
    const ProductsScreen(),
    SearchScreen(),
    const Profile(),
  ];
}
