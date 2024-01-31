import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/user_profile_screen/models/user_profile_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the UserProfileScreen.
///
/// This class manages the state of the UserProfileScreen, including the
/// current userProfileModelObj
class UserProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController petNameController = TextEditingController();

  Rx<UserProfileModel> userProfileModelObj = UserProfileModel().obs;

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    petNameController.dispose();
  }
}
