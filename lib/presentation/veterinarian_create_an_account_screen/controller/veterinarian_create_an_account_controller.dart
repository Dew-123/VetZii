import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/veterinarian_create_an_account_screen/models/veterinarian_create_an_account_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the VeterinarianCreateAnAccountScreen.
///
/// This class manages the state of the VeterinarianCreateAnAccountScreen, including the
/// current veterinarianCreateAnAccountModelObj
class VeterinarianCreateAnAccountController extends GetxController {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController fieldOfExpertiseController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  Rx<VeterinarianCreateAnAccountModel> veterinarianCreateAnAccountModelObj =
      VeterinarianCreateAnAccountModel().obs;

  @override
  void onClose() {
    super.onClose();
    fullNameController.dispose();
    addressController.dispose();
    fieldOfExpertiseController.dispose();
    emailController.dispose();
    mobileNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
