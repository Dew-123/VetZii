import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../routes/app_routes.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../main_menu_veterinarina_page/main_menu_veterinarina_page.dart';
import '../pending_appointments_page/pending_appointments_page.dart';
import 'controller/pending_appointments_container_controller.dart';

class PendingAppointmentsContainerScreen
    extends GetWidget<PendingAppointmentsContainerController> {
  const PendingAppointmentsContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: AppRoutes.pendingAppointmentsPage,
                onGenerateRoute: (routeSetting) => GetPageRoute(
                    page: () => getCurrentPage(routeSetting.name!),
                    transition: Transition.noTransition)),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type), id: 1);
    });
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
