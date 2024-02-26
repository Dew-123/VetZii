import 'package:mihan_s_application1/presentation/disease_prediction_enter_symptoms_screen/disease_prediction_enter_symptoms_screen.dart';
import 'package:mihan_s_application1/presentation/pet_owner_create_an_account_screen/binding/pet_owner_create_an_account_binding.dart';
import 'package:mihan_s_application1/presentation/pet_owner_create_an_account_screen/pet_owner_create_an_account_screen.dart';
import 'package:mihan_s_application1/presentation/user_sign_in_screen/binding/user_sign_in_binding.dart';
import 'package:mihan_s_application1/presentation/user_sign_in_screen/user_sign_in_screen.dart';

import 'controller/pet_owner_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class PetOwnerLoginScreen extends GetWidget<PetOwnerLoginController> {
  const PetOwnerLoginScreen({Key? key})
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
                width: 243.h,
                margin: EdgeInsets.only(right: 66.h),
                child: Text(
                  "msg_welcome_pet_parents".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.displaySmall,
                ),
              ),
              SizedBox(height: 47.v),
              CustomImageView(
                imagePath: ImageConstant.imgPngwing4,
                height: 263.v,
                width: 225.h,
                margin: EdgeInsets.only(left: 37.h),
              ),
              SizedBox(height: 71.v),
              CustomElevatedButton(
                text: "lbl_log_in".tr,
                onPressed: (){
                  Get.toNamed(AppRoutes.userSignInScreen);
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
                        "msg_don_t_have_an_account".tr,
                        style: CustomTextStyles.titleSmallBlack90002Medium,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 13.h),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.petOwnerCreateAnAccountScreen);
                        },
                        child: Text(
                          "lbl_sign_up".tr,
                          style: CustomTextStyles.titleSmallIndigoA700,
                        ),
                      ),
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
