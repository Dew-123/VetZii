import '../pet_owner_create_an_account_screen/widgets/petownercreateanaccount_item_widget.dart';
import 'controller/pet_owner_create_an_account_controller.dart';
import 'models/petownercreateanaccount_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/core/utils/validation_functions.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';
import 'package:mihan_s_application1/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class PetOwnerCreateAnAccountScreen
    extends GetWidget<PetOwnerCreateAnAccountController> {
  PetOwnerCreateAnAccountScreen({Key? key})
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
                    _buildNameOfThePet(),
                    SizedBox(height: 20.v),
                    _buildPetType(),
                    SizedBox(height: 21.v),
                    _buildPetOwnerCreateAnAccount(),
                    SizedBox(height: 27.v),
                    _buildEmail(),
                    SizedBox(height: 19.v),
                    _buildMobileNumber(),
                    SizedBox(height: 17.v),
                    _buildPassword(),
                    SizedBox(height: 16.v),
                    _buildConfirmPassword(),
                    SizedBox(height: 5.v),
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
        text: "msg_create_account_for".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildFullName() {
    return CustomTextFormField(
      controller: controller.fullNameController,
      hintText: "lbl_full_name".tr,
      hintStyle: theme.textTheme.titleSmall!,
      validator: (value) {
        if (!isText(value)) {
          return "err_msg_please_enter_valid_text".tr;
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildNameOfThePet() {
    return CustomTextFormField(
      controller: controller.nameOfThePetController,
      hintText: "lbl_nam_of_the_pet".tr,
      hintStyle: theme.textTheme.titleSmall!,
    );
  }

  /// Section Widget
  Widget _buildPetType() {
    return CustomTextFormField(
      controller: controller.petTypeController,
      hintText: "lbl_pet_type".tr,
      hintStyle: theme.textTheme.titleSmall!,
    );
  }

  /// Section Widget
  Widget _buildPetOwnerCreateAnAccount() {
    return SizedBox(
      height: 20.v,
      child: Obx(
        () => ListView.separated(
          padding: EdgeInsets.only(
            left: 20.h,
            right: 28.h,
          ),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 29.h,
            );
          },
          itemCount: controller.petOwnerCreateAnAccountModelObj.value
              .petownercreateanaccountItemList.value.length,
          itemBuilder: (context, index) {
            PetownercreateanaccountItemModel model = controller
                .petOwnerCreateAnAccountModelObj
                .value
                .petownercreateanaccountItemList
                .value[index];
            return PetownercreateanaccountItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail() {
    return CustomTextFormField(
      controller: controller.emailController,
      hintText: "lbl_email".tr,
      hintStyle: theme.textTheme.titleSmall!,
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
  Widget _buildMobileNumber() {
    return CustomTextFormField(
      controller: controller.mobileNumberController,
      hintText: "lbl_mobile_number".tr,
      hintStyle: theme.textTheme.titleSmall!,
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
  Widget _buildPassword() {
    return CustomTextFormField(
      controller: controller.passwordController,
      hintText: "lbl_password".tr,
      hintStyle: theme.textTheme.titleSmall!,
      textInputType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || (!isValidPassword(value, isRequired: true))) {
          return "err_msg_please_enter_valid_password".tr;
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
      hintText: "msg_confirm_password".tr,
      hintStyle: theme.textTheme.titleSmall!,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || (!isValidPassword(value, isRequired: true))) {
          return "err_msg_please_enter_valid_password".tr;
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
      text: "lbl_create_account".tr,
      margin: EdgeInsets.only(
        left: 85.h,
        right: 86.h,
        bottom: 42.v,
      ),
    );
  }
}
