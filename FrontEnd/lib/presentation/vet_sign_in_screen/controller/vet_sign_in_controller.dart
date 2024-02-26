import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/user_sign_in_screen/models/user_sign_in_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the UserSignInScreen.
///
/// This class manages the state of the UserSignInScreen, including the
/// current userSignInModelObj
class VetSignInController extends GetxController {
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<UserSignInModel> userSignInModelObj = UserSignInModel().obs;

  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    passwordController.dispose();
  }
}
