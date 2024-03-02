import 'controller/book_appointment_confrm_controller.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';


class BookAppointmentConfrmDialog extends StatelessWidget {
  BookAppointmentConfrmDialog({Key? key,})
      : super(
          key: key,
        );

  BookAppointmentConfrmController controller = Get.put(BookAppointmentConfrmController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 314.h,
      padding: EdgeInsets.symmetric(
        horizontal: 45.h,
        vertical: 6.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder48,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 25.v),
          Container(
            height: 131.adaptSize,
            width: 131.adaptSize,
            padding: EdgeInsets.all(29.h),
            decoration: AppDecoration.fillLightGreen.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder64,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgCheckmark,
              height: 72.adaptSize,
              width: 72.adaptSize,
              alignment: Alignment.center,
            ),
          ),
          SizedBox(height: 36.v),
          Text(
            "msg_congratulations".tr,
            style: CustomTextStyles.titleLargeInterBluegray900,
          ),
          SizedBox(height: 9.v),
          SizedBox(
            width: 222.h,
            child: Text(
              "msg_your_appointment".tr,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodyMediumPoppinsGray60002.copyWith(
                height: 1.50,
              ),
            ),
          ),
          SizedBox(height: 31.v),
          CustomElevatedButton(
            height: 48.v,
            text: "lbl_done".tr,
            buttonStyle: CustomButtonStyles.fillPrimaryTL24,
            buttonTextStyle: theme.textTheme.titleMedium!,
          ),
          SizedBox(height: 19.v),
          Text(
            "msg_edit_your_appointment".tr,
            style: CustomTextStyles.bodyMediumGray60002,
          ),
        ],
      ),
    );
  }
}
