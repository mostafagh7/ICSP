import 'package:e_commerce/Widget/buttonnew.dart';
import 'package:e_commerce/Widget/my_textfield.dart';
import 'package:e_commerce/moduels/auth/log_in/login_screen.dart';
import 'package:e_commerce/moduels/auth/sign_up/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
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
                numberorText: false,
                textController: controller.namecontroller.value,
                hintText: "Name",
                obscureText: false,
              ),
              const SizedBox(
                height: 10,
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
              Row(
                children: [
                  Expanded(
                    child: MyTextField(
                      numberorText: false,
                      textController: controller.addresscontroller.value,
                      hintText: "Address",
                      obscureText: false,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 45),
                      child: Obx(() {
                        return DropdownButton(
                          items: [
                            const DropdownMenuItem(
                                value: 'select_governorate',
                                child: Text('Select Governorate')),
                            ...controller.governorate
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                          ],
                          onChanged: (val) {
                            controller.selectedgovernorate.value =
                                val.toString();
                          },
                          value: controller.selectedgovernorate.value,
                        );
                      }))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Select Your Car Brand (optional)",
                      style: TextStyle(color: Colors.grey[700], fontSize: 16),
                    ),
                    DropdownButton(
                      items: [
                        const DropdownMenuItem(
                            value: 'select_car', child: Text('Select Car')),
                        ...controller.carBrandList
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                      ],
                      onChanged: (val) {
                        controller.selectedCarBrand.value = val.toString();
                        controller.getCarSpares();
                      },
                      value: controller.selectedCarBrand.value,
                    )
                  ],
                );
              }),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Select Your Car Model (optional)",
                      style: TextStyle(color: Colors.grey[700], fontSize: 16),
                    ),
                    DropdownButton(
                      items: [
                        const DropdownMenuItem(
                            value: 'select_model', child: Text('Select Model')),
                        ...controller.carSparesModel
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                      ],
                      onChanged: (v) {
                        controller.selectedItemModel.value = v.toString();
                        controller.getCarSpares();
                      },
                      value: controller.selectedItemModel.value,
                    ),
                  ],
                );
              }),
              MyTextField(
                  textController: controller.passcontroller.value,
                  obscureText: true,
                  hintText: "Password",
                  numberorText: false),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  textController: controller.confirmPasscontroller.value,
                  obscureText: true,
                  hintText: "Confirm Password",
                  numberorText: false),
              const SizedBox(
                height: 25,
              ),
              MyButtonNew(
                icon: Icons.login,
                text: "Sign Up",
                onTap: () async {
                  controller.check();
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.off(LogInScreen());
                    },
                    child: const Text(
                      "Login now",
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
