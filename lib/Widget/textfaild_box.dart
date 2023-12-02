import 'package:e_commerce/Widget/my_textfield.dart';
import 'package:flutter/material.dart';

class MyTextFieldBox extends StatelessWidget {
  final TextEditingController? textController;

  final String text;
  final String sectionName;
  final void Function()? onPressed;
  const MyTextFieldBox(
      {super.key,
      required this.text,
      required this.sectionName,
      this.onPressed,
      this.textController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: MyTextField(
                      textController: textController,
                      hintText: text,
                      numberorText: false)),
              IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.save),
                color: Colors.grey[400],
              )
            ],
          ),
        ],
      ),
    );
  }
}
