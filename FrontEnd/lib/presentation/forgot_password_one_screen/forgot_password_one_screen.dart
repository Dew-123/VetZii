import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/core/utils/validation_functions.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';
import 'package:mihan_s_application1/widgets/custom_text_form_field.dart';
import 'package:mihan_s_application1/http_req/serverHandling.dart';
import 'controller/forgot_password_one_controller.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordOneScreen extends GetWidget<ForgotPasswordOneController> {
  ForgotPasswordOneScreen({Key? key})
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
                  top: 86.v,
                  right: 25.h,
                ),
                child: Column(
                  children: [
                    Container(
                      width: 297.h,
                      margin: EdgeInsets.symmetric(horizontal: 6.h),
                      child: Text(
                        "please enter your registered email below".tr,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.titleSmallPoppinsBlack90002,
                      ),
                    ),
                    SizedBox(height: 70.v),
                    _buildEmail(),
                    SizedBox(height: 86.v),
                    CustomElevatedButton(
                      width: 189.h,
                      text: "send".tr,
                      onPressed: () async {
                        ServerHandling server = new ServerHandling();
                        String email =controller.emailController.text;
                        print(email);
                        bool isavailble =await server.checkUser(email);
                        print(isavailble);
                        if(isavailble){
                          String recoverCode= await server.recoverEmail(controller.emailController.text);
                          print(recoverCode);
                          Get.toNamed(AppRoutes.forgotPasswordTwoScreen,arguments:[recoverCode,email]);
                        }else{
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('No User Found'),
                                content: Text('No user was found with the provided email.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                      }
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
      height: 51.v,
      leadingWidth: 47.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 22.h,
          top: 12.v,
          bottom: 14.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Forgot Password".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail() {
    return CustomTextFormField(
      controller: controller.emailController,
      hintText: "lbl_email".tr,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || (!isValidEmail(value, isRequired: true))) {
          return "err_msg_please_enter_valid_email".tr;
        }
        return null;
      },
    );
  }
}
