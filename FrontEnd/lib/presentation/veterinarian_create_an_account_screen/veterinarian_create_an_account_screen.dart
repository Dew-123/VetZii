import 'controller/veterinarian_create_an_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/core/utils/validation_functions.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';
import 'package:mihan_s_application1/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class VeterinarianCreateAnAccountScreen
    extends GetWidget<VeterinarianCreateAnAccountController> {
  VeterinarianCreateAnAccountScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.lightGreen20001,
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
                  horizontal: 25.h,
                  vertical: 24.v,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 98.v,
                      width: 97.h,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgImage9284,
                            height: 98.v,
                            width: 97.h,
                            radius: BorderRadius.circular(
                              48.h,
                            ),
                            alignment: Alignment.center,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgThumbsUp,
                            height: 21.adaptSize,
                            width: 21.adaptSize,
                            alignment: Alignment.bottomRight,
                            margin: EdgeInsets.only(
                              right: 8.h,
                              bottom: 3.v,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.v),
                    _buildFullName(),
                    SizedBox(height: 20.v),
                    _buildAddress(),
                    SizedBox(height: 20.v),
                    _buildFieldOfExpertise(),
                    SizedBox(height: 17.v),
                    _buildEmail(),
                    SizedBox(height: 13.v),
                    _buildMobileNumber(),
                    SizedBox(height: 17.v),
                    _buildPassword(),
                    SizedBox(height: 16.v),
                    _buildConfirmPassword(),
                    SizedBox(height: 20.v),
                    Container(
                      width: 261.h,
                      margin: EdgeInsets.only(
                        left: 24.h,
                        right: 23.h,
                      ),
                      child: Text(
                        "You must be verified as a veterinarian by admin to create an account".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodySmallLatoGray800,
                      ),
                    ),
                    SizedBox(height: 6.v),
                    Text(
                      "Contact Admin".tr,
                      style: CustomTextStyles.bodySmallLatoOnPrimary.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(height: 6.v),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildCreateAccount(),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 49.v,
      leadingWidth: 47.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 22.h,
          top: 12.v,
          bottom: 12.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "Create Account for Veterinarian".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildFullName() {
    return CustomTextFormField(
      controller: controller.fullNameController,
      hintText: "full name".tr,
      hintStyle: theme.textTheme.titleSmall!,
      validator: (value) {
        if (!isText(value)) {
          return "Please enter valid text".tr;
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildAddress() {
    return CustomTextFormField(
      controller: controller.addressController,
      hintText: "address of the clinic".tr,
      hintStyle: theme.textTheme.titleSmall!,
    );
  }

  /// Section Widget
  Widget _buildFieldOfExpertise() {
    return CustomTextFormField(
      controller: controller.fieldOfExpertiseController,
      hintText: "field of expertise".tr,
      hintStyle: theme.textTheme.titleSmall!,
    );
  }

  /// Section Widget
  Widget _buildEmail() {
    return CustomTextFormField(
      controller: controller.emailController,
      hintText: "email".tr,
      hintStyle: theme.textTheme.titleSmall!,
      textInputType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || (!isValidEmail(value, isRequired: true))) {
          return "Please enter valid email".tr;
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildMobileNumber() {
    return CustomTextFormField(
      controller: controller.mobileNumberController,
      hintText: "mobile number".tr,
      hintStyle: theme.textTheme.titleSmall!,
      textInputType: TextInputType.phone,
      validator: (value) {
        if (!isValidPhone(value)) {
          return "Please enter valid phone number".tr;
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildPassword() {
    return CustomTextFormField(
      controller: controller.passwordController,
      hintText: "password".tr,
      hintStyle: theme.textTheme.titleSmall!,
      textInputType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || (!isValidPassword(value, isRequired: true))) {
          return "Please enter valid password".tr;
        }
        return null;
      },
      obscureText: true,
    );
  }

  /// Section Widget
  Widget _buildConfirmPassword() {
    return CustomTextFormField(
      controller: controller.confirmPasswordController,
      hintText: "confirm password".tr,
      hintStyle: theme.textTheme.titleSmall!,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || (!isValidPassword(value, isRequired: true))) {
          return "Please enter valid password".tr;
        }
        return null;
      },
      obscureText: true,
    );
  }

  /// Section Widget
  Widget _buildCreateAccount() {
    return CustomElevatedButton(
      width: 189.h,
      text: "Create Account".tr,
      margin: EdgeInsets.only(
        left: 85.h,
        right: 86.h,
        bottom: 42.v,
      ),
    );
  }
}
