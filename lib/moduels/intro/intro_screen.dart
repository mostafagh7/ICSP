import '../../../Widget/button.dart';
import '../../../Widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 25,
            ),
            //shop name
            Text(
              "Cars Man",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 28, color: Colors.white),
            ),
            const SizedBox(
              height: 25,
            ),

            //icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Lottie.asset('assets/json/caranim.json'),
            ),
            const SizedBox(
              height: 25,
            ),
            //title

            Text(
              "Your reference to fix your car",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 44, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            //subtitile
            Text(
              "Selling all kinds of car parts in Iraq and the possibility of delivering parts to homes ",
              style: TextStyle(color: Colors.grey[300], height: 2),
            ),
            const SizedBox(
              height: 25,
            ),

            Align(
              alignment: Alignment.center,
              child: MyButton(
                width: 200,
                height: 75,
                text: "Get Started",
                onTap: () {
                  Get.toNamed("/home");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
