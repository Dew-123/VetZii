import 'controller/main_menu_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/clinic_map_page/clinic_map_page.dart';
import 'package:mihan_s_application1/presentation/directory_vets_page/directory_vets_page.dart';
import 'package:mihan_s_application1/presentation/main_menu_page/main_menu_page.dart';
import 'package:mihan_s_application1/presentation/my_appointments_page/my_appointments_page.dart';
import 'package:mihan_s_application1/widgets/custom_bottom_bar.dart';

class MainMenuContainerScreen extends GetWidget<MainMenuContainerController> {
  const MainMenuContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: AppRoutes.mainMenuPage,
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
