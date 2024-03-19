import 'widgets/petownercreateanaccount_item_widget.dart';
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
import 'package:mihan_s_application1/http_req/serverHandling.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


// ignore_for_file: must_be_immutable
class PetOwnerCreateAnAccountScreen
    extends GetWidget<PetOwnerCreateAnAccountController> {

  final RxString _selectedGender = RxString('');
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
                    _buildFirstName(),
                    SizedBox(height: 20.v),
                    _buildLasttName(),
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
        bottomNavigationBar: _buildCreateAccount(context),
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
        text: "Create Account for Pet Owner".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildFirstName( ) {
    return CustomTextFormField(
      controller: controller.firstNameController,
      hintText: "first name".tr,
      hintStyle: theme.textTheme.titleSmall!,
      validator: (value) {
        if (!isText(value)) {
          return "Please enter valid text".tr;
        }
        return null;
      },
    );
  }
  Widget _buildLasttName( ) {
    return CustomTextFormField(
      controller: controller.lastNameController,
      hintText: "last name".tr,
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
  Widget _buildNameOfThePet() {
    return CustomTextFormField(
      controller: controller.nameOfThePetController,
      hintText: "name of the pet".tr,
      hintStyle: theme.textTheme.titleSmall!,
    );
  }

  /// Section Widget
  Widget _buildPetType() {
    return CustomTextFormField(
      controller: controller.petTypeController,
      hintText: "pet type".tr,
      hintStyle: theme.textTheme.titleSmall!,
    );
  }

  /// Section Widget
  // Widget _buildPetOwnerCreateAnAccount() {
  //   return SizedBox(
  //     height: 20.v,
  //     child: Obx(
  //       () => ListView.separated(
  //         padding: EdgeInsets.only(
  //           left: 20.h,
  //           right: 28.h,
  //         ),
  //         scrollDirection: Axis.horizontal,
  //         separatorBuilder: (
  //           context,
  //           index,
  //         ) {
  //           return SizedBox(
  //             width: 29.h,
  //           );
  //         },
  //         itemCount: controller.petOwnerCreateAnAccountModelObj.value
  //             .petownercreateanaccountItemList.value.length,
  //         itemBuilder: (context, index) {
  //           PetownercreateanaccountItemModel model = controller
  //               .petOwnerCreateAnAccountModelObj
  //               .value
  //               .petownercreateanaccountItemList
  //               .value[index];
  //           return PetownercreateanaccountItemWidget(
  //             model,
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }
  Widget _buildPetOwnerCreateAnAccount() {
    return SizedBox(
      height: 20.v,
      child: Obx(
            () => Row(
          children: [
            Text(
              'Pet\'s Gender:', // Text indicating the purpose
              style: TextStyle(fontSize: 14), // Adjust font size as needed
            ),
            SizedBox(width: 10), // Adjust spacing between text and radio buttons
            Radio(
              value: 'male',
              groupValue: _selectedGender.value,
              onChanged: (value) {
                _selectedGender.value = value as String;
              },
            ),
            Text('Male'),
            SizedBox(width: 20), // Adjust spacing between radio buttons
            Radio(
              value: 'female',
              groupValue: _selectedGender.value,
              onChanged: (value) {
                _selectedGender.value = value as String;
              },
            ),
            Text('Female'),
          ],
        ),
      ),
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
          return "Please enter valid text".tr;
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
  _buildCreateAccount(BuildContext context) {
    return CustomElevatedButton(
      onPressed: ()=> createAccount(context),
      width: 189.h,
      text: "Create Account".tr,
      margin: EdgeInsets.only(
        left: 85.h,
        right: 86.h,
        bottom: 42.v,
      ),
    );
  }



  void createAccount(BuildContext context) async {
    // Retrieve values from controllers
    String firstName = controller.firstNameController.text;
    String lastName = controller.lastNameController.text;
    String email = controller.emailController.text;
    String mobileNumber = controller.mobileNumberController.text;
    String password = controller.passwordController.text;
    String confirmPassword= controller.confirmPasswordController.text;
    String nameOfThePet = controller.nameOfThePetController.text;
    String petType = controller.petTypeController.text;
    String selectedGender = _selectedGender.value;

    try {
      if (password == confirmPassword) {
        // Check if any field is empty
        if (firstName.isEmpty ||
            lastName.isEmpty ||
            email.isEmpty ||
            mobileNumber.isEmpty ||
            password.isEmpty ||
            confirmPassword.isEmpty ||
            nameOfThePet.isEmpty ||
            petType.isEmpty ||
            selectedGender.isEmpty) {
          // Show error dialog if any field is empty
          showDialogBox(context, 'Error', 'Please fill in all fields');
          return; // Exit the method
        }

        var response = await http.post(
          Uri.parse('http://10.0.2.2:3000/dataAddUser'),
          body:{
            'Fname': firstName,
            'Lname': lastName,
            'nameOfThePet': nameOfThePet,
            'petType': petType,
            'gender': selectedGender,
            'email': email,
            'mobileNumber': mobileNumber,
            'password': password,
          },
        );

        if (response.statusCode == 200) {
          ServerHandling server = new ServerHandling();
          List<dynamic> data = await server.fetchUserData(email, password);
          Get.toNamed(AppRoutes.mainMenuContainerScreen, arguments: data);
        } else if (response.statusCode == 400) {
          showDialogBox(context,'Email Already in Use','The email provided is already associated with an existing account.');
        } else {
          showDialogBox(context,'Failed to add data','Issue with the server');
        }
      } else {
        showDialogBox(context, 'Password Mismatch', 'Passwords do not match');
      }
    } catch (error) {
      // Handle any errors that might occur during the HTTP request
      print('Error creating account: $error');
    }
  }
  Future<dynamic> showDialogBox(BuildContext context,String tittle,String content) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(tittle),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }



}
