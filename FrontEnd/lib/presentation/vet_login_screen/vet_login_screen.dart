import 'controller/vet_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';
import 'package:get/get.dart';
// ignore_for_file: must_be_immutable
class VetLoginScreen extends GetWidget<VetLoginController> {
  const VetLoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.lightGreen20001,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 12.v),
              Container(
                width: 298.h,
                margin: EdgeInsets.only(right: 11.h),
                child: Text(
                  "Welcome, Healing Heroes..!".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.displaySmall,
                ),
              ),
              SizedBox(height: 37.v),
              CustomImageView(
                imagePath: ImageConstant.imgPngwing2,
                height: 274.adaptSize,
                width: 274.adaptSize,
                alignment: Alignment.center,
              ),
              SizedBox(height: 60.v),
              CustomElevatedButton(
                text: "Log in".tr,
                onPressed: (){
                  Get.toNamed(AppRoutes.vetSignIn);
                },
              ),
              SizedBox(height: 27.v),
              Padding(
                padding: EdgeInsets.only(left: 34.h),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.v),
                      child: Text(
                        "Don't have an account?".tr,
                        style: CustomTextStyles.titleSmallBlack90002Medium,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 13.h),
                      child: GestureDetector(child:Text(
                        "Sign up".tr,
                        style: CustomTextStyles.titleSmallIndigoA700,
                      ),
                      onTap:() {Get.toNamed(AppRoutes.veterinarianCreateAnAccountScreen);}),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
