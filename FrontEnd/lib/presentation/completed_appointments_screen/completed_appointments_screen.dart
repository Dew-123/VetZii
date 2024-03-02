import 'package:dulanjana_s_application2/presentation/pending_appointments_page/pending_appointments_page.dart';
import 'package:dulanjana_s_application2/presentation/main_menu_veterinarina_page/main_menu_veterinarina_page.dart';
import 'package:dulanjana_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:dulanjana_s_application2/widgets/app_bar/appbar_subtitle.dart';
import 'widgets/completedappointments_item_widget.dart';
import 'models/completedappointments_item_model.dart';
import 'package:dulanjana_s_application2/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:dulanjana_s_application2/core/app_export.dart';
import 'controller/completed_appointments_controller.dart';

// ignore_for_file: must_be_immutable
class CompletedAppointmentsScreen
    extends GetWidget<CompletedAppointmentsController> {
  const CompletedAppointmentsScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 20.v),
              _buildCompletedAppointments(),
              Spacer(),
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
      centerTitle: true,
      title: AppbarSubtitle(
        text: "msg_completed_appointments".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildCompletedAppointments() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Obx(
            () => ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
              context,
              index,
              ) {
            return SizedBox(
              height: 20.v,
            );
          },
          itemCount: controller.completedAppointmentsModelObj.value
              .completedappointmentsItemList.value.length,
          itemBuilder: (context, index) {
            CompletedappointmentsItemModel model = controller
                .completedAppointmentsModelObj
                .value
                .completedappointmentsItemList
                .value[index];
            return CompletedappointmentsItemWidget(
              model,
            );
          },
        ),
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
      case BottomBarEnum.Homeerrorcontainer:
        return AppRoutes.pendingAppointmentsPage;
      case BottomBarEnum.Timelimit34x34:
        return "/";
      case BottomBarEnum.Audit:
        return "/";
      case BottomBarEnum.Lock:
        return AppRoutes.mainMenuVeterinarinaPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.pendingAppointmentsPage:
        return PendingAppointmentsPage();
      case AppRoutes.mainMenuVeterinarinaPage:
        return MainMenuVeterinarinaPage();
      default:
        return DefaultWidget();
    }
  }
}
