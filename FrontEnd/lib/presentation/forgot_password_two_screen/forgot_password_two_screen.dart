import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';
import 'package:mihan_s_application1/widgets/custom_text_form_field.dart';
import 'controller/forgot_password_two_controller.dart';


// ignore_for_file: must_be_immutable
class ForgotPasswordTwoScreen extends GetWidget<ForgotPasswordTwoController> {
  const ForgotPasswordTwoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 25.h,
            top: 88.v,
            right: 25.h,
          ),
          child: Column(
            children: [
              Container(
                width: 264.h,
                margin: EdgeInsets.only(
                  left: 23.h,
                  right: 22.h,
                ),
                child: Text(
                  "Please enter the verification code you received".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleSmallPoppinsBlack90002,
                ),
              ),
              SizedBox(height: 94.v),
              CustomTextFormField(
                controller: controller.codevalueController,
                hintText: "code".tr,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 86.v),
              CustomElevatedButton(
                width: 189.h,
                text: "Verify".tr,
                onPressed: () {
                  if(controller.codevalueController.text == Get.arguments[0]){
                    Get.toNamed(AppRoutes.forgotPasswordThreeScreen,arguments: Get.arguments[1]);
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Invalid code'),
                          content: Text('The code you entered below is not valid.'),
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
                    Future.delayed(Duration(seconds: 2), () {
                      Get.toNamed(AppRoutes.forgotPasswordOneScreen);
                    });
                  }
                },
              )
              ,
              SizedBox(height: 5.v),
            ],
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
        text: "Verification".tr,
      ),
    );
  }
}
