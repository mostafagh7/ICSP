import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Helpers extends GetxController {
  String imageUrl = "";
  sendimage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    // ignore: avoid_print
    print("${file?.path}");
    if (file == null) return;
    Reference referenceroot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceroot.child("images");
    Reference referenceImageToUpload = referenceDirImage.child(file.name);
    try {
      await referenceImageToUpload.putFile(File(file.path));
      imageUrl = await referenceImageToUpload.getDownloadURL();
    } catch (e) {
      // ignore: avoid_print
      print("Error $e");
    }
  }
    String? validateInput(String? value) {
    if (value == null ||
        value.length < 6 ||
        !RegExp(r'(?=.*[A-Za-z])(?=.*\d)').hasMatch(value)) {
      return 'يجب أن تحتوي كلمة المرور على 6 أحرف على الأقل وتتضمن أحرف وأرقام';
    }
    return null;
  }
}
