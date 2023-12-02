import 'package:e_commerce/Widget/colors.dart';
import 'package:e_commerce/moduels/auth/log_in/log_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class MyButtonNew extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final IconData? icon;
  const MyButtonNew(
      {super.key, required this.text, this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    LogInController controller = Get.put(LogInController());
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200.0,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              offset: Offset(0.0, 20.0),
              blurRadius: 30.0,
              color: Colors.black12)
        ], color: secondaryColor, borderRadius: BorderRadius.circular(22.0)),
        child: Row(
          children: [
            Container(
                height: 50.0,
                width: 150.0,
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 12.0),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(95.0),
                        topLeft: Radius.circular(95.0),
                        bottomRight: Radius.circular(200.0))),
                child: Obx(() {
                  return controller.isLoading.value
                      ? const GFLoader(
                          type: GFLoaderType.android,
                        )
                      : Text(
                          text,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.apply(color: Colors.white),
                        );
                })),
            Icon(
              icon,
              size: 30.0,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
