import 'package:mihan_s_application6/widgets/app_bar/custom_app_bar.dart';
import 'package:mihan_s_application6/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application6/widgets/app_bar/appbar_title.dart';
import 'package:mihan_s_application6/widgets/app_bar/appbar_trailing_image.dart';
import 'package:mihan_s_application6/widgets/custom_text_form_field.dart';
import 'package:mihan_s_application6/core/utils/validation_functions.dart';
import 'package:mihan_s_application6/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application6/core/app_export.dart';
import 'controller/user_profile_controller.dart';
import 'models/user_profile_model.dart';

class UserProfilePage extends StatelessWidget {
  UserProfilePage({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UserProfileController controller =
      Get.put(UserProfileController(UserProfileModel().obs));

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
                    _buildFive(),
                    SizedBox(height: 14.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "lbl_phone_number".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(height: 5.v),
                    _buildPhoneNumber(),
                    SizedBox(height: 8.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "lbl_email".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(height: 5.v),
                    _buildEmail(),
                    SizedBox(height: 14.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "lbl_name_of_the_pet".tr,
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(height: 5.v),
                    _buildName1(),
                    Spacer(),
                    SizedBox(height: 15.v),
                    _buildLogOut(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 47.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 22.h,
          bottom: 4.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
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
  Widget _buildName() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_name".tr,
            style: theme.textTheme.titleSmall,
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
  Widget _buildFive() {
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
          _buildName(),
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
  Widget _buildName1() {
    return CustomTextFormField(
      controller: controller.nameController1,
      hintText: "lbl_kitty".tr,
      textInputAction: TextInputAction.done,
    );
  }

  /// Section Widget
  Widget _buildLogOut() {
    return CustomElevatedButton(
      text: "lbl_log_out".tr,
      margin: EdgeInsets.only(
        left: 25.h,
        right: 24.h,
      ),
    );
  }
}
