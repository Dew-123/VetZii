import 'widgets/appointmentsuccess_item_widget.dart';
import 'controller/notifications_have_controller.dart';
import 'models/appointmentsuccess_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/clinic_map_page/clinic_map_page.dart';
import 'package:mihan_s_application1/presentation/my_appointments_page/my_appointments_page.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mihan_s_application1/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class NotificationsHaveScreen extends GetWidget<NotificationsHaveController> {
  const NotificationsHaveScreen({Key? key})
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
            horizontal: 21.h,
            vertical: 22.v,
          ),
          child: Column(
            children: [
              _buildSeventyFour(),
              SizedBox(height: 25.v),
              _buildAppointmentSuccess(),
              SizedBox(height: 18.v),
              _buildYesterday(),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
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
        text: "Notifications".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildSeventyFour() {
    return Padding(
      padding: EdgeInsets.only(right: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1.v),
            child: Text(
              "Today".tr.toUpperCase(),
              style: theme.textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4.v),
            child: Text(
              "Mark all as read".tr,
              style: CustomTextStyles.titleSmallPoppinsBluegray900,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAppointmentSuccess() {
    return Padding(
      padding: EdgeInsets.only(
        left: 4.h,
        right: 1.h,
      ),
      child: Obx(
        () => ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 32.v,
            );
          },
          itemCount: controller.notificationsHaveModelObj.value
              .appointmentsuccessItemList.value.length,
          itemBuilder: (context, index) {
            AppointmentsuccessItemModel model = controller
                .notificationsHaveModelObj
                .value
                .appointmentsuccessItemList
                .value[index];
            return AppointmentsuccessItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildYesterday() {
    return Padding(
      padding: EdgeInsets.only(right: 1.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 3.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    "Yesterday".tr,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.v),
                  child: Text(
                    "Mark all as read".tr,
                    style: CustomTextStyles.titleSmallPoppinsBluegray900,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgUser,
                height: 49.adaptSize,
                width: 49.adaptSize,
                margin: EdgeInsets.only(
                  top: 1.v,
                  bottom: 19.v,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 17.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "msg_appointment_success2".tr,
                        style: CustomTextStyles.titleMediumBluegray900,
                      ),
                      SizedBox(height: 2.v),
                      SizedBox(
                        width: 245.h,
                        child: Text(
                          "msg_you_have_successfully4".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyMediumPoppinsGray60002
                              .copyWith(
                            height: 1.50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Get.toNamed(getCurrentRoute(type), id: 1);
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Homeprimarycontainer:
        return AppRoutes.mainMenuPage;
      case BottomBarEnum.Linkedin:
        return AppRoutes.clinicMapPage;
      case BottomBarEnum.Thumbsupblack90002:
        return AppRoutes.directoryVetsPage;
      case BottomBarEnum.Lock:
        return AppRoutes.myAppointmentsPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      // case AppRoutes.mainMenuPage:
      //   return MainMenuPage();
      case AppRoutes.clinicMapPage:
        return ClinicMapPage();
      case AppRoutes.directoryVetsPage:
        //return DirectoryVetsPage();
      case AppRoutes.myAppointmentsPage:
        return MyAppointmentsPage();
      default:
        return DefaultWidget();
    }
  }
}
