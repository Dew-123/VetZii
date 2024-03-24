import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/pet_owner_create_an_account_screen/models/pet_owner_create_an_account_model.dart';
import 'package:flutter/material.dart';

class PetOwnerCreateAnAccountController extends GetxController {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  TextEditingController nameOfThePetController = TextEditingController();

  TextEditingController petTypeController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  Rx<PetOwnerCreateAnAccountModel> petOwnerCreateAnAccountModelObj =
      PetOwnerCreateAnAccountModel().obs;

  @override
  void onClose() {
    super.onClose();
    fullNameController.dispose();
    nameOfThePetController.dispose();
    petTypeController.dispose();
    emailController.dispose();
    mobileNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
