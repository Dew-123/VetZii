import 'package:mihan_s_application6/presentation/user_profile_page/user_profile_page.dart';
import 'package:mihan_s_application6/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application6/core/app_export.dart';
import 'controller/user_profile_container_controller.dart';

class UserProfileContainerScreen
    extends GetWidget<UserProfileContainerController> {
  const UserProfileContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: AppRoutes.userProfilePage,
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
      case BottomBarEnum.Home:
        return "/";
      case BottomBarEnum.Linkedin:
        return "/";
      case BottomBarEnum.Thumbsup:
        return "/";
      case BottomBarEnum.Contrast:
        return AppRoutes.userProfilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.userProfilePage:
        return UserProfilePage();
      default:
        return DefaultWidget();
    }
  }
}
