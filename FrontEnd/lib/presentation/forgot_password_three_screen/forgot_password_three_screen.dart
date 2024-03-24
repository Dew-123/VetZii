import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/core/utils/validation_functions.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';
import 'package:mihan_s_application1/widgets/custom_text_form_field.dart';
import 'controller/forgot_password_three_controller.dart';
import 'package:mihan_s_application1/http_req/serverHandling.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordThreeScreen
    extends GetWidget<ForgotPasswordThreeController> {
  ForgotPasswordThreeScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  left: 25.h,
                  top: 90.v,
                  right: 25.h,
                ),
                child: Column(
                  children: [
                    Text(
                      "Please enter your new password".tr,
                      style: CustomTextStyles.titleSmallPoppinsBlack90002,
                    ),
                    SizedBox(height: 58.v),
                    CustomTextFormField(
                      controller: controller.newpasswordController,
                      hintText: "new password".tr,
                      textInputType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null ||
                            (!isValidPassword(value, isRequired: true))) {
                          return "Please enter valid password".tr;
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 37.v),
                    CustomTextFormField(
                      controller: controller.confirmpasswordController,
                      hintText: "confirm password".tr,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null ||
                            (!isValidPassword(value, isRequired: true))) {
                          return "Please enter valid password".tr;
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 63.v),
                    CustomElevatedButton(
                      width: 189.h,
                      text: "Reset Password".tr,
                        onPressed: () async {
                        String newPassword = controller.newpasswordController.text;
                        String confirmPassword = controller.confirmpasswordController.text;
                        String email = Get.arguments;
                        print(email);
                        if(newPassword == confirmPassword){

                          ServerHandling serverHandling = new ServerHandling();
                          await serverHandling.changeVetPassword(email,newPassword);
                          _showResetSuccessPopup(context);
                        }}
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 47.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 22.h,
          top: 12.v,
          bottom: 12.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Confirmation".tr,
      ),
    );
  }

  void _showResetSuccessPopup(BuildContext context) {
    Get.defaultDialog(
      title: "Reset Password Completed",
      middleText: "Your password has been reset successfully!",
      actions: [
        TextButton(
          onPressed: () {
            // Close the dialog
            Get.back();
            // Delayed navigation to userSignInScreen
            Future.delayed(Duration(seconds: 1), () {
              Get.offNamed(AppRoutes.userSignInScreen);
            });
          },
          child: Text('OK'),
        ),
      ],
    );
  }


}
