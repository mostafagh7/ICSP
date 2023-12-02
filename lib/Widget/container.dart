import '../../../../Widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyContainer extends StatelessWidget {
  final String text;
  final String image;

  const MyContainer({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: ListTile(
              title: Text(
                text,
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Image.asset(
            image,
            height: 150,
          ),
        ],
      ),
    );
  }
}
