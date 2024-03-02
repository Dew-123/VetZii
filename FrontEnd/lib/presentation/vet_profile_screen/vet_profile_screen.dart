import 'package:dulanjana_s_application2/presentation/pending_appointments_page/pending_appointments_page.dart';
import 'package:dulanjana_s_application2/presentation/main_menu_veterinarina_page/main_menu_veterinarina_page.dart';
import 'package:dulanjana_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:dulanjana_s_application2/widgets/app_bar/appbar_title.dart';
import 'package:dulanjana_s_application2/widgets/app_bar/appbar_trailing_image.dart';
import 'package:dulanjana_s_application2/widgets/custom_text_form_field.dart';
import 'package:dulanjana_s_application2/core/utils/validation_functions.dart';
import 'package:dulanjana_s_application2/widgets/custom_elevated_button.dart';
import 'package:dulanjana_s_application2/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:dulanjana_s_application2/core/app_export.dart';
import 'controller/vet_profile_controller.dart';

// ignore_for_file: must_be_immutable
class VetProfileScreen extends GetWidget<VetProfileController> {
  VetProfileScreen({Key? key})
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
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(height: 5.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse268,
                          height: 78.adaptSize,
                          width: 78.adaptSize,
                          radius: BorderRadius.circular(
                            39.h,
                          ),
                        ),
                        SizedBox(height: 16.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 25.h),
                            child: Text(
                              "lbl_full_name".tr,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.v),
                        _buildFullName(),
                        SizedBox(height: 10.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 25.h),
                            child: Text(
                              "lbl_email".tr,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.v),
                        _buildEmail(),
                        SizedBox(height: 10.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 27.h),
                            child: Text(
                              "lbl_mobile_number".tr,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.v),
                        _buildMobileNumber(),
                        SizedBox(height: 11.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 25.h),
                            child: Text(
                              "msg_field_of_expertise".tr,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.v),
                        _buildFour(),
                        SizedBox(height: 8.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 25.h),
                            child: Text(
                              "lbl_experience".tr,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.v),
                        _buildDescription(),
                        SizedBox(height: 9.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 25.h),
                            child: Text(
                              "msg_education_and_training".tr,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                        SizedBox(height: 3.v),
                        _buildDescription1(),
                        SizedBox(height: 10.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 25.h),
                            child: Text(
                              "msg_services_offered".tr,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.v),
                        _buildSeven(),
                        SizedBox(height: 11.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 28.h),
                            child: Text(
                              "lbl_contact_details".tr,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                        SizedBox(height: 3.v),
                        _buildDescription2(),
                        SizedBox(height: 10.v),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 29.h),
                            child: Text(
                              "msg_past_treatment_records".tr,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                        SizedBox(height: 6.v),
                        _buildEditText(),
                        SizedBox(height: 33.v),
                        _buildUpdate(),
                        SizedBox(height: 50.v),
                        _buildFortyFive(),
                      ],
                    ),
                  ),
                ),
              ],
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
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_your_profile".tr,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgLogoutRounded,
          margin: EdgeInsets.fromLTRB(20.h, 17.v, 20.h, 15.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildFullName() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h),
      child: CustomTextFormField(
        controller: controller.fullNameController,
        hintText: "msg_dr_scott_adkins".tr,
        hintStyle: CustomTextStyles.bodyMedium13,
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail() {
    return Padding(
      padding: EdgeInsets.only(
        left: 25.h,
        right: 23.h,
      ),
      child: CustomTextFormField(
        controller: controller.emailController,
        hintText: "msg_example_gmail_com".tr,
        hintStyle: CustomTextStyles.bodyMedium13,
        textInputType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || (!isValidEmail(value, isRequired: true))) {
            return "err_msg_please_enter_valid_email".tr;
          }
          return null;
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildMobileNumber() {
    return Padding(
      padding: EdgeInsets.only(
        left: 28.h,
        right: 22.h,
      ),
      child: CustomTextFormField(
        controller: controller.mobileNumberController,
        hintText: "lbl_0718562485".tr,
        hintStyle: CustomTextStyles.bodyMedium13,
        textInputType: TextInputType.phone,
        validator: (value) {
          if (!isValidPhone(value)) {
            return "err_msg_please_enter_valid_phone_number".tr;
          }
          return null;
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildFour() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h),
      child: CustomTextFormField(
        controller: controller.fourController,
        hintText: "msg_small_animal_care".tr,
        maxLines: 2,
      ),
    );
  }

  /// Section Widget
  Widget _buildDescription() {
    return Padding(
      padding: EdgeInsets.only(
        left: 25.h,
        right: 24.h,
      ),
      child: CustomTextFormField(
        controller: controller.descriptionController,
        hintText: "msg_over_5_years_of".tr,
        maxLines: 4,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 11.h,
          vertical: 2.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDescription1() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h),
      child: CustomTextFormField(
        controller: controller.descriptionController1,
        hintText: "msg_graduate_of_abc".tr,
        maxLines: 3,
      ),
    );
  }

  /// Section Widget
  Widget _buildSeven() {
    return Container(
      width: 310.h,
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.outlineErrorContainer1.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Container(
        width: 250.h,
        margin: EdgeInsets.only(right: 39.h),
        child: Text(
          "msg_routine_check_u".tr,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodySmall,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDescription2() {
    return Padding(
      padding: EdgeInsets.only(
        left: 28.h,
        right: 22.h,
      ),
      child: CustomTextFormField(
        controller: controller.descriptionController2,
        hintText: "msg_clinic_or_practice".tr,
        maxLines: 4,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 11.h,
          vertical: 12.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEditText() {
    return Padding(
      padding: EdgeInsets.only(
        left: 29.h,
        right: 21.h,
      ),
      child: CustomTextFormField(
        controller: controller.editTextController,
        textInputAction: TextInputAction.done,
      ),
    );
  }

  /// Section Widget
  Widget _buildUpdate() {
    return CustomElevatedButton(
      height: 45.v,
      text: "lbl_update".tr,
      margin: EdgeInsets.only(
        left: 52.h,
        right: 47.h,
      ),
      buttonStyle: CustomButtonStyles.fillPrimary,
      buttonTextStyle: CustomTextStyles.titleSmallSemiBold,
    );
  }

  /// Section Widget
  Widget _buildFortyFive() {
    return Align(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 33.h),
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgHomeErrorcontainer,
                height: 24.adaptSize,
                width: 24.adaptSize,
                margin: EdgeInsets.symmetric(vertical: 2.v),
              ),
              Spacer(
                flex: 28,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgFrame1000001008,
                height: 30.v,
                width: 213.h,
              ),
              Spacer(
                flex: 71,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgContrast,
                height: 28.adaptSize,
                width: 28.adaptSize,
              ),
            ],
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
