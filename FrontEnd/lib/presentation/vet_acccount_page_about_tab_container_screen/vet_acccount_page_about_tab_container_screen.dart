import 'package:mihan_s_application1/presentation/directory_vets_page/models/userprofile_item_model.dart';
import 'package:mihan_s_application1/presentation/vet_acccount_page_book_page/vet_acccount_page_book_page.dart';

import 'controller/vet_acccount_page_about_tab_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/vet_acccount_page_about_page/vet_acccount_page_about_page.dart';
import 'package:mihan_s_application1/presentation/vet_acccount_page_reviews_page/vet_acccount_page_reviews_page.dart';
import 'package:mihan_s_application1/dataHandling/data.dart';
class VetAcccountPageAboutTabContainerScreen
    extends GetWidget<VetAcccountPageAboutTabContainerController> {

  const VetAcccountPageAboutTabContainerScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgArrowDown,
                  height: 25.adaptSize,
                  width: 25.adaptSize,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 22.h),
                ),
                SizedBox(height: 12.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse268128x128,
                          height: 128.adaptSize,
                          width: 128.adaptSize,
                          radius: BorderRadius.circular(
                            64.h,
                          ),
                          margin: EdgeInsets.only(top: 9.v),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgMoreVertical,
                          height: 36.v,
                          width: 22.h,
                          margin: EdgeInsets.only(
                            left: 74.h,
                            bottom: 101.v,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 19.v),
              SizedBox(
                width: 150.h,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: UserData.fullName_vet + '\n', // Add '\n' to display on a new line
                        style: CustomTextStyles.titleMediumff000000,
                      ),
                      TextSpan(
                        text:  UserData.fieldOfExpertise_vet.toString(),
                        style: CustomTextStyles.bodySmallff000000,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
                SizedBox(height: 28.v),
                _buildTabview(),
                SizedBox(
                  height: 969.v,
                  child: TabBarView(
                    controller: controller.tabviewController,
                    children: [
                      VetAcccountPageBookPage(),
                      VetAcccountPageAboutPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview() {
    return Container(
      height: 35.v,
      width: 320.h,
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
              "lbl_book".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_about2".tr,
            ),
          ),
        ],
      ),
    );
  }
}
