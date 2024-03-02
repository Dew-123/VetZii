import 'package:get/get.dart';
import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../models/pendingappointments_item_model.dart';
import '../controller/pending_appointments_controller.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PendingappointmentsItemWidget extends StatelessWidget {
  PendingappointmentsItemWidget(
      this.pendingappointmentsItemModelObj, {
        Key? key,
      }) : super(
    key: key,
  );

  PendingappointmentsItemModel pendingappointmentsItemModelObj;

  var controller = Get.find<PendingAppointmentsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 13.h,
        vertical: 11.v,
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
            margin: EdgeInsets.only(
              top: 2.v,
              bottom: 8.v,
            ),
            child: Obx(
                  () => Text(
                pendingappointmentsItemModelObj.nameOfTheClient!.value,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 75.h),
            child: Column(
              children: [
                _buildConfirm(),
                SizedBox(height: 12.v),
                _buildDecline(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildConfirm() {
    return CustomElevatedButton(
      width: 65.h,
      text: "lbl_confirm".tr,
      buttonTextStyle: theme.textTheme.labelLarge!,
    );
  }

  /// Section Widget
  Widget _buildDecline() {
    return CustomElevatedButton(
      width: 65.h,
      text: "lbl_decline".tr,
      buttonStyle: CustomButtonStyles.fillOnError,
      buttonTextStyle: CustomTextStyles.labelLargeOnPrimary,
    );
  }
}
