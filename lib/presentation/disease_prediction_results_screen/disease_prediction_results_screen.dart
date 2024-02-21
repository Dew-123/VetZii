import 'controller/disease_prediction_results_controller.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class DiseasePredictionResultsScreen
    extends GetWidget<DiseasePredictionResultsController> {
  const DiseasePredictionResultsScreen({Key? key})
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
            horizontal: 35.h,
            vertical: 27.v,
          ),
          child: Column(
            children: [
              Text(
                "msg_prediction_result".tr,
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 43.v),
              Container(
                margin: EdgeInsets.only(left: 5.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 23.h,
                  vertical: 82.v,
                ),
                decoration: AppDecoration.outlineBlack900023.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder48,
                ),
                child: SizedBox(
                  width: 236.h,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "msg_our_analysis_indicates2".tr,
                          style: CustomTextStyles.bodyMediumPoppinsff000000,
                        ),
                        TextSpan(
                          text: "msg_kidney_failure_please".tr,
                          style: CustomTextStyles.titleSmallPoppinsffdc2c2c,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildGoBackToMainMenu(),
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
        text: "msg_disease_prediction".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildGoBackToMainMenu() {
    return CustomElevatedButton(
      text: "msg_go_back_to_main".tr,
      margin: EdgeInsets.only(
        left: 50.h,
        right: 49.h,
        bottom: 42.v,
      ),
    );
  }
}
