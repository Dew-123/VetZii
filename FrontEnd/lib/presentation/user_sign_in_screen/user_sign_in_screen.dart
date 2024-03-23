
import '../../dataHandling/data.dart';
import 'controller/user_sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/core/utils/validation_functions.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';
import 'package:mihan_s_application1/widgets/custom_text_form_field.dart';
import 'package:mihan_s_application1/http_req/serverHandling.dart';


class UserSignInScreen extends GetWidget<UserSignInController> {

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
                      "Hi, Welcome Back!".tr,
                      style: CustomTextStyles.headlineSmallBlack90002,
                    ),
                    SizedBox(height: 56.v),
                    CustomTextFormField(
                      controller: controller.userNameController,
                      hintText: "email".tr,
                      hintStyle: theme.textTheme.titleSmall!,
                      validator: (value) {
                        if (!isText(value)) {
                          return "Please enter valid text.".tr;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 21.v),
                    CustomTextFormField(
                      controller: controller.passwordController,
                      hintText: "password".tr,
                      hintStyle: theme.textTheme.titleSmall!,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null ||
                            (!isValidPassword(value, isRequired: true))) {
                          return "Please enter valid password.".tr;
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 27.v),
                    GestureDetector(child: Text(
                      "Forgot password?".tr,
                      style: CustomTextStyles.titleSmallBlack90002,
                    ),onTap: ()=>{Get.toNamed(AppRoutes.forgotPasswordOneScreen)}),
                    SizedBox(height: 22.v),
                  CustomElevatedButton(
                    width: 189.h,
                    text: "Log In".tr,
                    onPressed: () async {
                      //Get.toNamed(AppRoutes.mainMenuContainerScreen);
                      String email = controller.userNameController.text.removeAllWhitespace;
                      String password = controller.passwordController.text.removeAllWhitespace;

                      try {
                        ServerHandling server = new ServerHandling();
                        List<dynamic> data = await server.fetchUserData(email,password);
                        print(data);

                        if (data.isNotEmpty) {
                          UserData.firstName = data[0]['Fname'];
                          UserData.lastName = data[0]['Lname'];
                          UserData.petName = data[0]['nameOfThePet'];
                          UserData.petType = data[0]['petType'];
                          UserData.gender = data[0]['gender'];
                          UserData.email = data[0]['email'];
                          UserData.mobileNumber = data[0]['mobileNumber'];
                          UserData.password = data[0]['password'];
                          Get.toNamed(AppRoutes.mainMenuContainerScreen);
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('No User Found',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: Text('No user was found with the provided email and password.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16, // Adjust the font size
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      } catch (e) {
                        // Handle any errors that might occur during data fetching
                        print('Error fetching data: $e');
                      }
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


}
