import 'controller/clinic_page_vets_tab_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/clinic_page/clinic_page.dart';
import 'package:mihan_s_application1/presentation/clinic_page_vets_page/clinic_page_vets_page.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class ClinicPageVetsTabContainerScreen
    extends GetWidget<ClinicPageVetsTabContainerController> {
  const ClinicPageVetsTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildSevenStack(),
              Column(
                children: [
                  SizedBox(height: 24.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 17.h),
                      child: Text(
                        "msg_galle_vet_care_animal".tr,
                        style: CustomTextStyles.titleLarge_1,
                      ),
                    ),
                  ),
                  SizedBox(height: 17.v),
                  _buildTabview(),
                  SizedBox(
                    height: 427.v,
                    child: TabBarView(
                      controller: controller.tabviewController,
                      children: [
                        ClinicPage(),
                        ClinicPageVetsPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSevenStack() {
    return SizedBox(
      height: 239.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle4243,
            height: 239.v,
            width: 360.h,
            alignment: Alignment.center,
          ),
          CustomAppBar(
            height: 41.v,
            leadingWidth: 47.h,
            leading: AppbarLeadingImage(
              imagePath: ImageConstant.imgArrowDownBlack90001,
              margin: EdgeInsets.only(
                left: 22.h,
                bottom: 4.v,
              ),
            ),
            actions: [
              AppbarTrailingImage(
                imagePath: ImageConstant.imgNotification,
                margin: EdgeInsets.only(
                  left: 20.h,
                  top: 7.v,
                  right: 20.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview() {
    return Container(
      height: 36.v,
      width: 289.h,
      child: TabBar(
        controller: controller.tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: appTheme.lightGreen700,
        labelStyle: TextStyle(
          fontSize: 16.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelColor: appTheme.gray60001,
        unselectedLabelStyle: TextStyle(
          fontSize: 16.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        indicatorColor: appTheme.lightGreen700,
        tabs: [
          Tab(
            child: Text(
              "lbl_about".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_veterinarians".tr,
            ),
          ),
        ],
      ),
    );
  }
}
