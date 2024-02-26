import '../controller/notifications_have_controller.dart';
import '../models/appointmentsuccess_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class AppointmentsuccessItemWidget extends StatelessWidget {
  AppointmentsuccessItemWidget(
    this.appointmentsuccessItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  AppointmentsuccessItemModel appointmentsuccessItemModelObj;

  var controller = Get.find<NotificationsHaveController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => CustomImageView(
            imagePath: appointmentsuccessItemModelObj.userImage!.value,
            height: 49.adaptSize,
            width: 49.adaptSize,
            margin: EdgeInsets.only(
              top: 9.v,
              bottom: 11.v,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 18.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    appointmentsuccessItemModelObj
                        .appointmentSuccessText!.value,
                    style: CustomTextStyles.titleMediumBluegray900,
                  ),
                ),
                SizedBox(height: 2.v),
                SizedBox(
                  width: 245.h,
                  child: Obx(
                    () => Text(
                      appointmentsuccessItemModelObj.successMessageText!.value,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          CustomTextStyles.bodyMediumPoppinsGray60002.copyWith(
                        height: 1.50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
