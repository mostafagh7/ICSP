import '../../../../Widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class MyCard extends StatelessWidget {
  final String text;
  final String? image;
  final double? width;
  final double? height;
  final String? animation;
  final void Function()? onTap;
  const MyCard({
    Key? key,
    required this.text,
    required this.onTap,
    this.image,
    this.animation,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: Card(
          
          color: secondaryColor,
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                title: Center(
                  child: Text(
                    text,
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              if (image != null) Image.asset(image!, height: 100, width: 200),
              if (animation != null) Lottie.asset(animation!),
            ],
          ),
        ),
      ),
    );
  }
}
