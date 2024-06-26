import 'controller/disease_prediction_start_controller.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class DiseasePredictionStartScreen
    extends GetWidget<DiseasePredictionStartController> {
  const DiseasePredictionStartScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 28.h,
            vertical: 27.v,
          ),
          child: Column(
            children: [
              SizedBox(
                width: 302.h,
                child: Text(
                  "Welcome to our Disease Prediction feature! We understand the importance of early detection and proactive pet care. Our advanced system analyzes a variety of symptoms to predict potential health issues in your beloved pets.\nPlease remember that while this tool offers predictive information, consulting with a veterinarian for a professional assessment is crucial for accurate diagnosis and personalized care. Your pet's health is our priority, and we're here to support you on their journey to a happy and healthy life.".tr,
                  maxLines: 13,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMediumPoppins14,
                ),
              ),
              SizedBox(height: 59.v),
              CustomImageView(
                imagePath: ImageConstant.imgPngwing3,
                height: 196.v,
                width: 230.h,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildStartButton(),
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
          bottom: 17.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitle(
        text: "Disease Prediction".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildStartButton() {
    return CustomElevatedButton(
      text: "Start".tr,
      margin: EdgeInsets.only(
        left: 50.h,
        right: 49.h,
        bottom: 42.v,
      ),
      onPressed: () {
        // Navigate to the relevant page (e.g., diseasePredictionEnterScreen)
        Get.toNamed(AppRoutes.diseasePredictionEnterSymptomsScreen);
      },
    );
  }
}
