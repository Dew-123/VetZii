import '../my_appointments_page/widgets/appointmentcard_item_widget.dart';
import 'controller/my_appointments_controller.dart';
import 'models/appointmentcard_item_model.dart';
import 'models/my_appointments_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';

class MyAppointmentsPage extends StatelessWidget {
  MyAppointmentsPage({Key? key})
      : super(
          key: key,
        );

  MyAppointmentsController controller =
      Get.put(MyAppointmentsController(MyAppointmentsModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: EdgeInsets.only(
            left: 17.h,
            top: 23.v,
            right: 17.h,
          ),
          child: Obx(
            () => ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (
                context,
                index,
              ) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.5.v),
                  child: SizedBox(
                    width: 294.h,
                    child: Divider(
                      height: 1.v,
                      thickness: 1.v,
                      color: appTheme.gray20001,
                    ),
                  ),
                );
              },
              itemCount: controller.myAppointmentsModelObj.value
                  .appointmentcardItemList.value.length,
              itemBuilder: (context, index) {
                AppointmentcardItemModel model = controller
                    .myAppointmentsModelObj
                    .value
                    .appointmentcardItemList
                    .value[index];
                return AppointmentcardItemWidget(
                  model,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 50.v,
      leadingWidth: 47.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 22.h,
          top: 12.v,
          bottom: 13.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "lbl_my_appointments".tr,
      ),
    );
  }
}
