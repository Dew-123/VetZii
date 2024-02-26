import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/forgot_password_three_screen/models/forgot_password_three_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ForgotPasswordThreeScreen.
///
/// This class manages the state of the ForgotPasswordThreeScreen, including the
/// current forgotPasswordThreeModelObj
class ForgotPasswordThreeController extends GetxController {
  TextEditingController newpasswordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  Rx<ForgotPasswordThreeModel> forgotPasswordThreeModelObj =
      ForgotPasswordThreeModel().obs;

  @override
  void onClose() {
    super.onClose();
    newpasswordController.dispose();
    confirmpasswordController.dispose();
  }
}
