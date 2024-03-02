import 'package:flutter/cupertino.dart';

import 'widgets/userprofile1_item_widget.dart';
import 'controller/adoption_and_rehoming_controller.dart';
import 'models/userprofile1_item_model.dart';
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
class AdoptionAndRehomingScreen
    extends GetWidget<AdoptionAndRehomingController> {
  const AdoptionAndRehomingScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          height: 635.v,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 14.h),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgSearch,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        margin: EdgeInsets.only(
                          top: 4.v,
                          bottom: 39.v,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: SizedBox(
                          height: 67.v,
                          child: VerticalDivider(
                            width: 1.h,
                            thickness: 1.v,
                            indent: 4.h,
                            endIndent: 37.h,
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.3,
                        child: Container(
                          width: 94.h,
                          margin: EdgeInsets.only(left: 2.h),
                          child: Text(
                            "lbl_search".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.headlineSmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                child: CustomImageView(
                  imagePath: ImageConstant.imgSettingsBlack90002,
                  height: 40.adaptSize,
                  width: 40.adaptSize,
                  alignment: Alignment.topRight,
                  onTap: ()=>{Get.toNamed(AppRoutes.rehomingFormScreen)} ,
                ),
              ),
              _buildUserProfile(),
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
      height: 56.v,
      leadingWidth: 47.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 22.h,
          top: 11.v,
          bottom: 19.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitle(
        text: "msg_adopt_or_find_a".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 5.h,
          top: 60.v,
          right: 4.h,
        ),
        child: Obx(
              () => ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
                context,
                index,
                ) {
              return SizedBox(
                height: 21.v,
              );
            },
            itemCount: controller.adoptionAndRehomingModelObj.value
                .userprofile1ItemList.value.length,
            itemBuilder: (context, index) {
              Userprofile1ItemModel model = controller
                  .adoptionAndRehomingModelObj
                  .value
                  .userprofile1ItemList
                  .value[index];
              return Userprofile1ItemWidget(
                model,
              );
            },
          ),
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
        return DirectoryVetsPage();
      case AppRoutes.myAppointmentsPage:
        return MyAppointmentsPage();
      default:
        return DefaultWidget();
    }
  }
}
