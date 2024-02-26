import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/forgot_password_two_screen/models/forgot_password_two_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ForgotPasswordTwoScreen.
///
/// This class manages the state of the ForgotPasswordTwoScreen, including the
/// current forgotPasswordTwoModelObj
class ForgotPasswordTwoController extends GetxController {
  TextEditingController codevalueController = TextEditingController();

  Rx<ForgotPasswordTwoModel> forgotPasswordTwoModelObj =
      ForgotPasswordTwoModel().obs;

  @override
  void onClose() {
    super.onClose();
    codevalueController.dispose();
  }
}
