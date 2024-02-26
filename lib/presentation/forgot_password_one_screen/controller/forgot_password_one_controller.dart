import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/forgot_password_one_screen/models/forgot_password_one_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ForgotPasswordOneScreen.
///
/// This class manages the state of the ForgotPasswordOneScreen, including the
/// current forgotPasswordOneModelObj
class ForgotPasswordOneController extends GetxController {
  TextEditingController emailController = TextEditingController();

  Rx<ForgotPasswordOneModel> forgotPasswordOneModelObj =
      ForgotPasswordOneModel().obs;

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }
}
