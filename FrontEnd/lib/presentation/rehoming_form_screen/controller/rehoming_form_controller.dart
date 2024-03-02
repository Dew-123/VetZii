import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class RehomingFormController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController enterDetailsController = TextEditingController();

  Rx<File?> imageFile = Rx<File?>(null);

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    descriptionController.dispose();
    enterDetailsController.dispose();
  }

  Future<void> pickImage() async {
    final pickedFile =
    await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }
}
