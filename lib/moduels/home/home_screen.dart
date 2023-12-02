import '../../../Widget/colors.dart';
import 'package:e_commerce/moduels/home/home_controller.dart';
import 'package:e_commerce/moduels/home/rive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeScreenController homecontroller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey[400],
          body: Obx(() {
            return IndexedStack(
              index: homecontroller.currentIndex.value,
              children: homecontroller.pages,
            );
          }),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Obx(() {
                return BottomNavigationBar(
                  backgroundColor: primaryColor,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  selectedLabelStyle: GoogleFonts.dmSerifDisplay(
                    fontSize: 14,
                  ),
                  unselectedLabelStyle: GoogleFonts.dmSerifDisplay(
                    fontSize: 12,
                  ),
                  currentIndex: homecontroller.currentIndex.value,
                  onTap: (int index) {
                    homecontroller.currentIndex.value = index;
                  },
                  items: [
                    BottomNavigationBarItem(
                      label: "Home",
                      icon: GestureDetector(
                        onTap: () {
                          homecontroller.currentIndex.value = 0;

                          homecontroller.tiggerHome.change(true);
                          Future.delayed(
                            const Duration(seconds: 1),
                            () {
                              homecontroller.tiggerHome.change(false);
                            },
                          );
                        },
                        child: SizedBox(
                          height: 36,
                          width: 36,
                          child: RiveAnimation.asset(
                            "assets/riv/1298-2487-animated-icon-set-1-color.riv",
                            artboard: "HOME",
                            onInit: (artboard) {
                              StateMachineController controller =
                                  RiveUtlis.getRiveController(artboard,
                                      stateMachineName: "HOME_interactivity");
                              homecontroller.tiggerHome =
                                  controller.findSMI("active") as SMIBool;
                            },
                          ),
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Search",
                      icon: GestureDetector(
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
                        child: SizedBox(
                          height: 36,
                          width: 36,
                          child: RiveAnimation.asset(
                            "assets/riv/1298-2487-animated-icon-set-1-color.riv",
                            artboard: "SEARCH",
                            onInit: (artboard) {
                              StateMachineController controller =
                                  RiveUtlis.getRiveController(artboard,
                                      stateMachineName: "SEARCH_Interactivity");
                              homecontroller.tiggerSearch =
                                  controller.findSMI("active") as SMIBool;
                            },
                          ),
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Profile",
                      icon: GestureDetector(
                        onTap: () {
                          homecontroller.currentIndex.value = 2;

                          homecontroller.tiggerProfile.change(true);
                          Future.delayed(
                            const Duration(seconds: 1),
                            () {
                              homecontroller.tiggerProfile.change(false);
                            },
                          );
                        },
                        child: SizedBox(
                          height: 36,
                          width: 36,
                          child: RiveAnimation.asset(
                            "assets/riv/1298-2487-animated-icon-set-1-color.riv",
                            artboard: "USER",
                            onInit: (artboard) {
                              StateMachineController controller =
                                  RiveUtlis.getRiveController(artboard,
                                      stateMachineName: "USER_Interactivity");
                              homecontroller.tiggerProfile =
                                  controller.findSMI("active") as SMIBool;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          )),
    );
  }
}
