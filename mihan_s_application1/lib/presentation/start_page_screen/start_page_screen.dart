import 'package:mihan_s_application1/presentation/pet_owner_login_screen/pet_owner_login_screen.dart';
import 'package:mihan_s_application1/presentation/vet_login_screen/vet_login_screen.dart';

import 'controller/start_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class StartPageScreen extends GetWidget<StartPageController> {
  const StartPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.lightGreen20001,
        body: SizedBox(
          height: 774.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 515.v,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Opacity(
                        opacity: 0.3,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgPngwing1,
                          height: 515.v,
                          width: 360.h,
                          alignment: Alignment.center,
                        ),
                      ),
                      _buildPetOwnerSection(),
                    ],
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgVetzii01,
                height: 283.v,
                width: 239.h,
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 38.v),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPetOwnerSection() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 25.h,
          right: 25.h,
          bottom: 75.v,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 180.h,
              child: Text(
                "lbl_get_started".tr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.displayMedium,
              ),
            ),
            SizedBox(height: 15.v),
            Text(
              "msg_are_you_a_pet_owner".tr,
              style: CustomTextStyles.titleSmallPoppinsBlack90002_1,
            ),
            SizedBox(height: 45.v),
            CustomElevatedButton(
              text: "lbl_pet_owner".tr,
              onPressed: (){
                Get.to(()=>PetOwnerLoginScreen());
              },
            ),
            SizedBox(height: 10.v),
            CustomElevatedButton(
              text: "lbl_veterinarian".tr,
              onPressed: (){
                Get.to(()=>VetLoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
