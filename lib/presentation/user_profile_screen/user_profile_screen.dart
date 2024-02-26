import 'controller/user_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/core/utils/validation_functions.dart';
import 'package:mihan_s_application1/presentation/clinic_map_page/clinic_map_page.dart';
import 'package:mihan_s_application1/presentation/directory_vets_page/directory_vets_page.dart';
import 'package:mihan_s_application1/presentation/main_menu_page/main_menu_page.dart';
import 'package:mihan_s_application1/presentation/my_appointments_page/my_appointments_page.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mihan_s_application1/widgets/custom_bottom_bar.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';
import 'package:mihan_s_application1/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class UserProfileScreen extends GetWidget<UserProfileController> {
  UserProfileScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 24.h,
                  vertical: 12.v,
                ),
                child: Column(
                  children: [
                    _buildNameStack(),
                    SizedBox(height: 14.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "lbl_phone_number".tr,
                        style:
                            CustomTextStyles.titleSmallPoppinsBlack90002Medium,
                      ),
                    ),
                    SizedBox(height: 5.v),
                    _buildPhoneNumber(),
                    SizedBox(height: 8.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "lbl_email2".tr,
                        style:
                            CustomTextStyles.titleSmallPoppinsBlack90002Medium,
                      ),
                    ),
                    SizedBox(height: 5.v),
                    _buildEmail(),
                    SizedBox(height: 14.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "lbl_name_of_the_pet".tr,
                        style:
                            CustomTextStyles.titleSmallPoppinsBlack90002Medium,
                      ),
                    ),
                    SizedBox(height: 5.v),
                    _buildPetName(),
                    Spacer(),
                    SizedBox(height: 15.v),
                    _buildLogoutButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 41.v,
      leadingWidth: 47.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 22.h,
          bottom: 4.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "lbl_user_profile".tr,
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
    );
  }

  /// Section Widget
  Widget _buildNameColumn() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_name".tr,
            style: CustomTextStyles.titleSmallPoppinsBlack90002Medium,
          ),
          SizedBox(height: 5.v),
          CustomTextFormField(
            controller: controller.nameController,
            hintText: "lbl_john_brown".tr,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNameStack() {
    return SizedBox(
      height: 169.v,
      width: 310.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse268,
            height: 109.adaptSize,
            width: 109.adaptSize,
            radius: BorderRadius.circular(
              54.h,
            ),
            alignment: Alignment.topCenter,
          ),
          _buildNameColumn(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumber() {
    return CustomTextFormField(
      controller: controller.phoneNumberController,
      hintText: "lbl_07245689536".tr,
      textInputType: TextInputType.phone,
      validator: (value) {
        if (!isValidPhone(value)) {
          return "err_msg_please_enter_valid_phone_number".tr;
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildEmail() {
    return CustomTextFormField(
      controller: controller.emailController,
      hintText: "msg_johnbrown_gmail_com".tr,
      textInputType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || (!isValidEmail(value, isRequired: true))) {
          return "err_msg_please_enter_valid_email".tr;
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildPetName() {
    return CustomTextFormField(
      controller: controller.petNameController,
      hintText: "lbl_kitty".tr,
      textInputAction: TextInputAction.done,
    );
  }

  /// Section Widget
  Widget _buildLogoutButton() {
    return CustomElevatedButton(
      text: "lbl_log_out".tr,
      margin: EdgeInsets.only(
        left: 25.h,
        right: 24.h,
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
