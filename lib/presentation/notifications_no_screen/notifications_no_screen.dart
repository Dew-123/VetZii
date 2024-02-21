import 'controller/notifications_no_controller.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/clinic_map_page/clinic_map_page.dart';
import 'package:mihan_s_application1/presentation/directory_vets_page/directory_vets_page.dart';
import 'package:mihan_s_application1/presentation/main_menu_page/main_menu_page.dart';
import 'package:mihan_s_application1/presentation/my_appointments_page/my_appointments_page.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mihan_s_application1/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class NotificationsNoScreen extends GetWidget<NotificationsNoController> {
  const NotificationsNoScreen({Key? key})
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
          padding: EdgeInsets.symmetric(horizontal: 73.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 1.v),
              Container(
                height: 202.adaptSize,
                width: 202.adaptSize,
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                decoration: AppDecoration.fillBlue.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder101,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgGroupLightGreen200,
                  height: 157.adaptSize,
                  width: 157.adaptSize,
                  alignment: Alignment.bottomRight,
                ),
              ),
              SizedBox(height: 30.v),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "msg_no_notifications".tr,
                  style: CustomTextStyles.titleLargeOnErrorContainer,
                ),
              ),
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
        text: "lbl_notifications".tr,
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
      case AppRoutes.mainMenuPage:
        return MainMenuPage();
      case AppRoutes.clinicMapPage:
        return ClinicMapPage();
      case AppRoutes.directoryVetsPage:
        return DirectoryVetsPage();
      case AppRoutes.myAppointmentsPage:
        return MyAppointmentsPage();
      default:
        return DefaultWidget();
    }
  }
}
