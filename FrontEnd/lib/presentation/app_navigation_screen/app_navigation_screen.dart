import 'controller/app_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          screenTitle: "splash screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "start page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.startPageScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "pet owner login".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.petOwnerLoginScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "vet login".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.vetLoginScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "user sign in".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.userSignInScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "pet owner create an account".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.petOwnerCreateAnAccountScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "veterinarian create an account".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.veterinarianCreateAnAccountScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "user profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.userProfileScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "main menu - Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.mainMenuContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "clinic page vets - Tab Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.clinicPageVetsTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "vet acccount page - about - Tab Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.vetAcccountPageAboutTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "book appointment".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.bookAppointmentScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "payment page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.paymentPageScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "notifications no".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.notificationsNoScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "notifications have".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.notificationsHaveScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "adoption and rehoming".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.adoptionAndRehomingScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "rehoming form".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.rehomingFormScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "disease prediction start".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.diseasePredictionStartScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "disease prediction enter symptoms".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.diseasePredictionEnterSymptomsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "disease prediction results".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.diseasePredictionResultsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "forgot password One".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.forgotPasswordOneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "forgot password Two".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.forgotPasswordTwoScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "forgot password Three".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.forgotPasswordThreeScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}
