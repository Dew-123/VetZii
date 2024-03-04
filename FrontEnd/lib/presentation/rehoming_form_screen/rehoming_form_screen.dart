import 'controller/rehoming_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';
import 'package:mihan_s_application1/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;

// ignore_for_file: must_be_immutable
class RehomingFormScreen extends GetWidget<RehomingFormController> {
  const RehomingFormScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 282.h,
                margin: EdgeInsets.only(
                  left: 2.h,
                  right: 25.h,
                ),
                child: Text(
                  "msg_enter_details_of".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleMediumMedium,
                ),
              ),
              SizedBox(height: 14.v),
              _buildEditText(),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildAddYourPet(),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 49.v,
      leadingWidth: 359.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDownBlack90002,
        margin: EdgeInsets.fromLTRB(26.h, 18.v, 318.h, 18.v),
      ),
    );
  }

  /// Section Widget
  Widget _buildName() {
    return CustomTextFormField(
      width: 200.h,
      controller: controller.nameController,
      borderDecoration: TextFormFieldStyleHelper.outlineBlack1,
      filled: false,
    );
  }

  Widget _buildDescription() {
    return CustomTextFormField(
      width: 200.h,
      controller: controller.descriptionController,
      borderDecoration: TextFormFieldStyleHelper.outlineBlack1,
      filled: false,
    );
  }

  /// Section Widget
  Widget _buildEnterDetails() {
    return CustomTextFormField(
      width: 200.h,
      controller: controller.enterDetailsController,
      borderDecoration: TextFormFieldStyleHelper.outlineBlack1,
      filled: false,
    );
  }

  /// Section Widget
  Widget _buildUploadImage() {
    return CustomTextFormField(
      width: 200.h,
      controller: controller.uploadImageController,
      hintText: "lbl_upload_an_image".tr,
      hintStyle: CustomTextStyles.labelLargeBlack90002,
      textInputAction: TextInputAction.done,
      maxLines: 7,
      contentPadding: EdgeInsets.all(30.h),
      borderDecoration: TextFormFieldStyleHelper.outlineBlack1,
      filled: false,
    );
  }

  /// Section Widget
  Widget _buildEditText() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 99.h,
          margin: EdgeInsets.only(
            top: 7.v,
            bottom: 126.v,
          ),
          child: Text(
            "msg_name_description".tr,
            maxLines: 9,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.titleMediumMedium,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 9.h),
          child: Column(
            children: [
              _buildName(),
              SizedBox(height: 12.v),
              _buildDescription(),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: appTheme.black90002.withOpacity(0.4),
                    width: 1.h,
                  ),
                ),
              ),
              SizedBox(height: 15.v),
              _buildEnterDetails(),
              SizedBox(height: 15.v),
              _buildUploadImage(),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildAddYourPet() {
    return CustomElevatedButton(
      onPressed: ()=> addPetData(),
      text: "lbl_add_your_pet".tr,
      margin: EdgeInsets.only(
        left: 50.h,
        right: 49.h,
        bottom: 42.v,
      ),
    );
  }

  void addPetData() async {
    // Retrieve values from controllers
    String name = controller.nameController.text;
    String description = controller.descriptionController.text;
    String contactNo = controller.enterDetailsController.text;
    // String uploadImage = controller.uploadImageController.text;

    try {
      var response = await http.post(
        Uri.parse('http://10.0.2.2:3000/addPet'), // Update with your API endpoint
        body: {
          'name': name,
          'description': description,
          'contactNo': contactNo,
          //'uploadImage': uploadImage,
        },
      );

      if (response.statusCode == 200) {
        // Pet data added successfully
        print('Pet data added successfully');
        Get.toNamed(AppRoutes.adoptionAndRehomingScreen);
      } else {
        // Failed to add pet data
        print('Failed to add pet data: ${response.body}');
      }
    } catch (error) {
      // Handle any errors that might occur during the HTTP request
      print('Error adding pet data: $error');
    }
  }

}
