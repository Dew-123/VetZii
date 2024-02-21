import '../controller/disease_prediction_enter_symptoms_controller.dart';
import '../models/diseasepredictioncheckboxes_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class DiseasepredictioncheckboxesItemWidget extends StatelessWidget {
  DiseasepredictioncheckboxesItemWidget(
    this.diseasepredictioncheckboxesItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  DiseasepredictioncheckboxesItemModel diseasepredictioncheckboxesItemModelObj;

  var controller = Get.find<DiseasePredictionEnterSymptomsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20.adaptSize,
          width: 20.adaptSize,
          padding: EdgeInsets.symmetric(
            horizontal: 5.h,
            vertical: 6.v,
          ),
          decoration: AppDecoration.outlineBluegray90014.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: Obx(
            () => CustomImageView(
              imagePath:
                  diseasepredictioncheckboxesItemModelObj.checkboxImage!.value,
              height: 8.v,
              width: 10.h,
              alignment: Alignment.center,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 6.h),
          child: Obx(
            () => Text(
              diseasepredictioncheckboxesItemModelObj.textValue!.value,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ),
      ],
    );
  }
}
