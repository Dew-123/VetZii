import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/user_sign_in_screen/models/user_sign_in_model.dart';
import 'package:flutter/material.dart';

class UserSignInController extends GetxController {
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
