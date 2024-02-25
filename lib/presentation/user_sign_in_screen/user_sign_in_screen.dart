
import 'controller/user_sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/core/utils/validation_functions.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';
import 'package:mihan_s_application1/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


// ignore_for_file: must_be_immutable
class UserSignInScreen extends GetWidget<UserSignInController> {

  String email="";
  String password="";
  UserSignInScreen({Key? key})
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
                  vertical: 56.v,
                ),
                child: Column(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgVetzii01,
                      height: 194.v,
                      width: 164.h,
                    ),
                    SizedBox(height: 4.v),
                    Text(
                      "msg_hi_welcome_back".tr,
                      style: CustomTextStyles.headlineSmallBlack90002,
                    ),
                    SizedBox(height: 56.v),
                    CustomTextFormField(
                      controller: controller.userNameController,
                      hintText: "lbl_email".tr,
                      hintStyle: theme.textTheme.titleSmall!,
                      validator: (value) {
                        if (!isText(value)) {
                          return "err_msg_please_enter_valid_text".tr;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 21.v),
                    CustomTextFormField(
                      controller: controller.passwordController,
                      hintText: "lbl_password".tr,
                      hintStyle: theme.textTheme.titleSmall!,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null ||
                            (!isValidPassword(value, isRequired: true))) {
                          return "err_msg_please_enter_valid_password".tr;
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 27.v),
                    Text(
                      "msg_forgot_password".tr,
                      style: CustomTextStyles.titleSmallBlack90002,
                    ),
                    SizedBox(height: 22.v),
                  CustomElevatedButton(
                    width: 189.h,
                    text: "lbl_log_in".tr,
                    onPressed: () async {
                      email = controller.userNameController.text.removeAllWhitespace;
                      password = controller.passwordController.text;

                      // Now you can use the username and password as needed
                      print('Username: $email');
                      print('Password: $password');
                      Get.toNamed(AppRoutes.mainMenuContainerScreen);
                      // try {
                      //   List<dynamic> data = await fetchData(email,password);
                      //   print(data);
                      //   // Add your logic to handle the fetched data here
                      //   // For example, you can navigate to another screen based on the data
                      //   if (data.isNotEmpty) {
                      //     // Assuming you want to navigate to MainMenuContainerScreen
                      //     Get.toNamed(AppRoutes.mainMenuContainerScreen,arguments: data);
                      //   } else {
                      //     // Handle case when no data is fetched
                      //     showDialog(
                      //       context: context,
                      //       builder: (BuildContext context) {
                      //         return AlertDialog(
                      //           title: Text('No User Found'),
                      //           content: Text('No user was found with the provided email and password.'),
                      //           actions: [
                      //             TextButton(
                      //               onPressed: () {
                      //                 Navigator.of(context).pop();
                      //               },
                      //               child: Text('OK'),
                      //             ),
                      //           ],
                      //         );
                      //       },
                      //     );
                      //   }
                      // } catch (e) {
                      //   // Handle any errors that might occur during data fetching
                      //   print('Error fetching data: $e');
                      // }
                    },
                  ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<List<dynamic>> fetchData(String email,String password) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/dataGetUser'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // Parse the JSON response body
      List<dynamic> data = json.decode(response.body);

      return data;
    } else {
      // If the server returns an error response, throw an exception
      throw Exception('Failed to load data');
    }
  }

}
