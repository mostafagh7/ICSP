import 'package:cool_alert/cool_alert.dart';
import 'package:e_commerce/Widget/buttonnew.dart';
import 'package:e_commerce/Widget/my_textfield.dart';
import 'package:e_commerce/moduels/auth/sign_up/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ConfirmCode extends StatelessWidget {
  ConfirmCode({super.key});
  SignUpController controller = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                maxLines: 2,
                "The verification code will be sent via WhatsApp to the number ${controller.phonecontroller.value.text}",
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
              numberorText: true,
              textController: controller.codecontroller.value,
              hintText: "Enter Code",
              obscureText: false,
            ),
            const SizedBox(
              height: 25,
            ),
            MyButtonNew(
              text: "Submet",
              icon: Icons.send,
              onTap: () async {
                final ref = controller.database
                    .ref("users")
                    .child(controller.phonecontroller.value.text)
                    .child("information")
                    .child("code");
                final snapshot = await ref.get();
                if (snapshot.value != null) {
                  if (controller.codecontroller.value.text == snapshot.value) {
                    await controller.database
                        .ref("users")
                        .child(controller.phonecontroller.value.text)
                        .child("information")
                        .child("confirm")
                        .set("YES");
                    // ignore: use_build_context_synchronously
                    await CoolAlert.show(
                      text: "Please log in ",
                      context: context,
                      type: CoolAlertType.success,
                    );
                    Get.offNamed("login");
                  } else {
                    Get.snackbar("Error", "message");
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
