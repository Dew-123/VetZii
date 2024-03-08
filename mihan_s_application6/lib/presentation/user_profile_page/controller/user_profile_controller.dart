import '../../../core/app_export.dart';
import '../models/user_profile_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the UserProfilePage.
///
/// This class manages the state of the UserProfilePage, including the
/// current userProfileModelObj
class UserProfileController extends GetxController {
  UserProfileController(this.userProfileModelObj);

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController nameController1 = TextEditingController();

  Rx<UserProfileModel> userProfileModelObj;

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    nameController1.dispose();
  }
}
