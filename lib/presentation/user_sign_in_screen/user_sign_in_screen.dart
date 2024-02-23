import 'package:mihan_s_application1/presentation/main_menu_container_screen/main_menu_container_screen.dart';
import 'package:mihan_s_application1/presentation/main_menu_page/main_menu_page.dart';

import 'controller/user_sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/core/utils/validation_functions.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';
import 'package:mihan_s_application1/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class UserSignInScreen extends GetWidget<UserSignInController> {

  String username="";
  String password="";
  UserSignInScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.lightGreen20001,
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
                padding: EdgeInsets.symmetric(
                  horizontal: 24.h,
                  vertical: 56.v,
                ),
                child: Column(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgVetzii01,
                      height: 194.v,
                      width: 164.h,
                    ),
                    SizedBox(height: 4.v),
                    Text(
                      "msg_hi_welcome_back".tr,
                      style: CustomTextStyles.headlineSmallBlack90002,
                    ),
                    SizedBox(height: 56.v),
                    CustomTextFormField(
                      controller: controller.userNameController,
                      hintText: "lbl_username".tr,
                      hintStyle: theme.textTheme.titleSmall!,
                      validator: (value) {
                        if (!isText(value)) {
                          return "err_msg_please_enter_valid_text".tr;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 21.v),
                    CustomTextFormField(
                      controller: controller.passwordController,
                      hintText: "lbl_password".tr,
                      hintStyle: theme.textTheme.titleSmall!,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null ||
                            (!isValidPassword(value, isRequired: true))) {
                          return "err_msg_please_enter_valid_password".tr;
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 27.v),
                    Text(
                      "msg_forgot_password".tr,
                      style: CustomTextStyles.titleSmallBlack90002,
                    ),
                    SizedBox(height: 22.v),
                    CustomElevatedButton(
                      width: 189.h,
                      text: "lbl_log_in".tr,
                      onPressed: ()=>{
                         username = controller.userNameController.text,
                         password = controller.passwordController.text,

                        // Now you can use the username and password as needed
                        print('Username: $username'),
                        print('Password: $password'),

                      Get.toNamed(AppRoutes.mainMenuContainerScreen)

                      // Add your login logic here
                      },
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
}
