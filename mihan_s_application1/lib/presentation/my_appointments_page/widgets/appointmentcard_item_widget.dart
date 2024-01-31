import '../controller/my_appointments_controller.dart';
import '../models/appointmentcard_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class AppointmentcardItemWidget extends StatelessWidget {
  AppointmentcardItemWidget(
    this.appointmentcardItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  AppointmentcardItemModel appointmentcardItemModelObj;

  var controller = Get.find<MyAppointmentsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 9.v,
      ),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 3.v),
          Obx(
            () => Text(
              appointmentcardItemModelObj.time!.value,
              style: CustomTextStyles.titleSmallInterBlack90002,
            ),
          ),
          SizedBox(height: 24.v),
          Padding(
            padding: EdgeInsets.only(right: 30.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgImage,
                  height: 109.adaptSize,
                  width: 109.adaptSize,
                  radius: BorderRadius.circular(
                    12.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    top: 8.v,
                    bottom: 4.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          appointmentcardItemModelObj.doctorName!.value,
                          style: CustomTextStyles.titleMediumInter,
                        ),
                      ),
                      SizedBox(height: 12.v),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgSettings,
                            height: 14.adaptSize,
                            width: 14.adaptSize,
                            margin: EdgeInsets.only(
                              top: 22.v,
                              bottom: 26.v,
                            ),
                          ),
                          Container(
                            width: 124.h,
                            margin: EdgeInsets.only(left: 4.h),
                            child: Obx(
                              () => Text(
                                appointmentcardItemModelObj.clinicName!.value,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.bodyMediumBluegray700
                                    .copyWith(
                                  height: 1.50,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomElevatedButton(
                  height: 37.v,
                  text: "lbl_cancel".tr,
                  margin: EdgeInsets.only(right: 8.h),
                  buttonStyle: CustomButtonStyles.fillGray,
                  buttonTextStyle: CustomTextStyles.titleSmallPoppinsBlack90002,
                ),
              ),
              Expanded(
                child: CustomElevatedButton(
                  height: 37.v,
                  text: "lbl_reschedule".tr,
                  margin: EdgeInsets.only(left: 8.h),
                  buttonTextStyle: CustomTextStyles.titleSmallPoppinsBlack90002,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
