import '../../../core/app_export.dart';
import '../models/vet_profile_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the VetProfileScreen.
///
/// This class manages the state of the VetProfileScreen, including the
/// current vetProfileModelObj
class VetProfileController extends GetxController {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileNumberController = TextEditingController();

  TextEditingController fourController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController descriptionController1 = TextEditingController();

  TextEditingController descriptionController2 = TextEditingController();

  TextEditingController editTextController = TextEditingController();

  Rx<VetProfileModel> vetProfileModelObj = VetProfileModel().obs;

  @override
  void onClose() {
    super.onClose();
    fullNameController.dispose();
    emailController.dispose();
    mobileNumberController.dispose();
    fourController.dispose();
    descriptionController.dispose();
    descriptionController1.dispose();
    descriptionController2.dispose();
    editTextController.dispose();
  }
}
