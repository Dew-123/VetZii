import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mihan_s_application1/core/app_export.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/theme_helper.dart';
import '../models/completedappointments_item_model.dart';
import '../controller/completed_appointments_controller.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CompletedappointmentsItemWidget extends StatelessWidget {
  CompletedappointmentsItemWidget(
      this.completedappointmentsItemModelObj, {
        Key? key,
      }) : super(
    key: key,
  );

  CompletedappointmentsItemModel completedappointmentsItemModelObj;

  var controller = Get.find<CompletedAppointmentsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.outlineErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 137.h,
            margin: EdgeInsets.only(bottom: 5.v),
            child: Obx(
                  () => Text(
                completedappointmentsItemModelObj.nameOfTheClient!.value,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgOk,
            height: 56.adaptSize,
            width: 56.adaptSize,
            margin: EdgeInsets.only(
              left: 90.h,
              top: 11.v,
              bottom: 5.v,
            ),
          ),
        ],
      ),
    );
  }
}
