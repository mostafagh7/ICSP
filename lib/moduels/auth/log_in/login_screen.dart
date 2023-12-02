import 'package:e_commerce/Widget/buttonnew.dart';
import 'package:e_commerce/Widget/my_textfield.dart';
import 'package:e_commerce/moduels/auth/log_in/log_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  LogInController controller = Get.find<LogInController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/images/1.png",
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Welcome back you've been missed!",
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                numberorText: true,
                textController: controller.phonecontroller.value,
                hintText: "Phone Number",
                obscureText: false,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                numberorText: false,
                textController: controller.passcontroller.value,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgor Password?",
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              MyButtonNew(
                icon: Icons.login,
                text: "Log In",
                onTap: () async {
                  await controller.login();
                  
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.offAllNamed("splash");
                },
                child: const Text(
                  "Continue as a guest",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
              // const SizedBox(
              //   height: 25,
              // ),
              //   Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SquareTile(
              //       path: "assets/images/google.png",
              //       height: 50,
              //       onTap: () {
              //         controller.signwithgoogle();
              //       },
              //     ),
              //     const SizedBox(
              //       width: 25,
              //     ),
              //     SquareTile(
              //       height: 50,
              //       path: "assets/images/R.png",
              //       onTap: () {

              //       },
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member?",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed("signup");
                    },
                    child: const Text(
                      "Register now",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
