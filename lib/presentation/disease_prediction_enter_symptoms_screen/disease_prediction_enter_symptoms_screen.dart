import '../disease_prediction_enter_symptoms_screen/widgets/diseasepredictioncheckboxes_item_widget.dart';
import 'controller/disease_prediction_enter_symptoms_controller.dart';
import 'models/diseasepredictioncheckboxes_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class DiseasePredictionEnterSymptomsScreen
    extends GetWidget<DiseasePredictionEnterSymptomsController> {
  const DiseasePredictionEnterSymptomsScreen({Key? key})
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
            horizontal: 40.h,
            vertical: 28.v,
          ),
          child: Column(
            children: [
              Text(
                "msg_please_select_the".tr,
                style: CustomTextStyles.bodyMediumPoppins14,
              ),
              SizedBox(height: 32.v),
              _buildDiseasePredictionCheckboxes(),
            ],
          ),
        ),
        bottomNavigationBar: _buildPredictButton(),
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
  Widget _buildDiseasePredictionCheckboxes() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h),
      child: Obx(
        () => ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 15.v,
            );
          },
          itemCount: controller.diseasePredictionEnterSymptomsModelObj.value
              .diseasepredictioncheckboxesItemList.value.length,
          itemBuilder: (context, index) {
            DiseasepredictioncheckboxesItemModel model = controller
                .diseasePredictionEnterSymptomsModelObj
                .value
                .diseasepredictioncheckboxesItemList
                .value[index];
            return DiseasepredictioncheckboxesItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPredictButton() {
    return CustomElevatedButton(
      text: "msg_predict_the_disease2".tr,
      margin: EdgeInsets.only(
        left: 50.h,
        right: 49.h,
        bottom: 42.v,
      ),
    );
  }
}
