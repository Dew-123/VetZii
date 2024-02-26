import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.lightGreen20001,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 60.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgVetzii01,
                          height: 283.v,
                          width: 239.h),
                      SizedBox(height: 36.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgLoading,
                          height: 76.adaptSize,
                          width: 76.adaptSize),
                      SizedBox(height: 5.v)
                    ]))));
  }
}
