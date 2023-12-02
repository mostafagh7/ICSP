import 'package:cool_alert/cool_alert.dart';
import 'package:e_commerce/Widget/drawer.dart';
import 'package:e_commerce/Widget/text_box.dart';
import 'package:e_commerce/Widget/textfaild_box.dart';
import 'package:e_commerce/moduels/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        title: const Text(
          "Profile",
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed("cart");
              },
              icon: const Icon(Icons.shopping_cart))
        ],
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Obx(() {
        if (controller.isLoading.value == true) {
          return const Center(child: GFLoader(
            type: GFLoaderType.ios,
          ));
        } else {
          return ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Icon(
                Icons.person,
                size: 72,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                controller.username.value,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  "My Details",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              controller.isEditingName.value
                  ? MyTextFieldBox(
                      textController: controller.nameController.value,
                      text: controller.username.value,
                      sectionName: "username",
                      onPressed: () {
                        controller.isEditingName.value =
                            !controller.isEditingName.value;
                        if (controller.nameController.value.text.isNotEmpty) {
                          try {
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.confirm,
                              text:
                                  "Are you sure you want to change your name?",
                              onConfirmBtnTap: () {
                                controller.changeName();
                              },
                            );
                          } catch (e) {
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.error,
                              text: "$e",
                            );
                          }
                        }
                      },
                    )
                  : MyTextBox(
                      yessicon: true,
                      text: controller.username.value,
                      sectionName: "username",
                      onPressed: () {
                        controller.isEditingName.value =
                            !controller.isEditingName.value;
                      },
                    ),
              MyTextBox(
                yessicon: false,
                text: controller.phoneNumber.value,
                sectionName: "phone number",
                onPressed: () {
                  controller.isEditingphone.value =
                      !controller.isEditingphone.value;
                },
              ),
              controller.isEditingaddress.value
                  ? MyTextFieldBox(
                      textController: controller.addressController.value,
                      text: controller.address.value,
                      sectionName: "address",
                      onPressed: () {
                        controller.isEditingaddress.value =
                            !controller.isEditingaddress.value;
                        if (controller
                            .addressController.value.text.isNotEmpty) {
                          try {
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.confirm,
                              text:
                                  "Are you sure you want to change your address?",
                              onConfirmBtnTap: () {
                                controller.changeAddress();
                              },
                            );
                          } catch (e) {
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.error,
                              text: "$e",
                            );
                          }
                        }
                      },
                    )
                  : MyTextBox(
                      yessicon: true,
                      text: controller.address.value,
                      sectionName: "address",
                      onPressed: () {
                        controller.isEditingaddress.value =
                            !controller.isEditingaddress.value;
                      },
                    ),
              controller.isEditinggovernorate.value
                  ? MyTextFieldBox(
                      textController: controller.governorateController.value,
                      text: controller.governorate.value,
                      sectionName: "governorate",
                      onPressed: () {
                        controller.isEditinggovernorate.value =
                            !controller.isEditinggovernorate.value;
                        if (controller
                            .governorateController.value.text.isNotEmpty) {
                          try {
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.confirm,
                              text:
                                  "Are you sure you want to change your governorate?",
                              onConfirmBtnTap: () {
                                controller.changeGovernorate();
                              },
                            );
                          } catch (e) {
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.error,
                              text: "$e",
                            );
                          }
                        }
                      },
                    )
                  : MyTextBox(
                      yessicon: true,
                      text: controller.governorate.value,
                      sectionName: "governorate",
                      onPressed: () {
                        controller.isEditinggovernorate.value =
                            !controller.isEditinggovernorate.value;
                      },
                    ),
              controller.isEditingcarbrand.value
                  ? MyTextFieldBox(
                      textController: controller.carbrandController.value,
                      text: controller.carbrand.value,
                      sectionName: "carbrand",
                      onPressed: () {
                        controller.isEditingcarbrand.value =
                            !controller.isEditingcarbrand.value;
                        if (controller
                            .carbrandController.value.text.isNotEmpty) {
                          try {
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.confirm,
                              text:
                                  "Are you sure you want to change your carbrand?",
                              onConfirmBtnTap: () {
                                controller.changeCarBrand();
                              },
                            );
                          } catch (e) {
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.error,
                              text: "$e",
                            );
                          }
                        }
                      },
                    )
                  : MyTextBox(
                      yessicon: true,
                      text: controller.carbrand.value,
                      sectionName: "carbrand",
                      onPressed: () {
                        controller.isEditingcarbrand.value =
                            !controller.isEditingcarbrand.value;
                      },
                    ),
              controller.isEditingcarmodel.value
                  ? MyTextFieldBox(
                      textController: controller.carmodelController.value,
                      text: controller.carmodel.value,
                      sectionName: "carmodel",
                      onPressed: () {
                        controller.isEditingcarmodel.value =
                            !controller.isEditingcarmodel.value;
                        if (controller
                            .carmodelController.value.text.isNotEmpty) {
                          try {
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.confirm,
                              text:
                                  "Are you sure you want to change your carmodel?",
                              onConfirmBtnTap: () {
                                controller.changeCarModel();
                              },
                            );
                          } catch (e) {
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.error,
                              text: "$e",
                            );
                          }
                        }
                      },
                    )
                  : MyTextBox(
                      yessicon: true,
                      text: controller.carmodel.value,
                      sectionName: "carmodel",
                      onPressed: () {
                        controller.isEditingcarmodel.value =
                            !controller.isEditingcarmodel.value;
                      },
                    ),
            ],
          );
        }
      }),
    );
  }
}
