import 'package:animated_splash_screen/animated_splash_screen.dart';
import '../../../Widget/colors.dart';
import 'package:e_commerce/moduels/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: secondaryColor,
      splash: Lottie.asset("assets/json/caranim.json"),
      splashIconSize: double.infinity,
      nextScreen:   HomeScreen(),
    );
  }
}
