import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/dataHandling/vetData.dart';
import 'package:mihan_s_application1/http_req/serverHandling.dart';
import 'package:mihan_s_application1/presentation/vet_profile_page/vet_profile_page.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';
import 'package:mihan_s_application1/widgets/custom_text_form_field.dart';

import '../../core/utils/validation_functions.dart';
import 'controller/vet_sign_in_controller.dart';

class VetSignInScreen extends GetWidget<VetSignInController> {
  VetSignInScreen({Key? key}) : super(key: key);

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
                    GestureDetector(
                      child: Text(
                        "contact admin".tr,
                        style: CustomTextStyles.titleSmallBlack90002,
                      ),
                      onTap: () {
                       // Get.toNamed(AppRoutes.forgotPasswordOneScreen);
                      },
                    ),
                    SizedBox(height: 22.v),
                    CustomElevatedButton(
                      width: 189.h,
                      text: "lbl_log_in".tr,
                      onPressed: () async {
                        String email =
                            controller.userNameController.text.removeAllWhitespace;
                        String password =
                            controller.passwordController.text.removeAllWhitespace;

                        if(email.isNotEmpty && password.isNotEmpty){
                          try {
                            ServerHandling server = new ServerHandling();
                            List<dynamic> data =
                                await server.fetchVetData(email, password);

                            if (data.isNotEmpty) {
                              VetData.fullName = data[0]['fullName'] ?? '';
                              VetData.addressClinic =
                                  data[0]['addressOfTheClinic'] ?? '';
                              VetData.fieldOfExpertise =
                                  data[0]['fieldOfExpertise'] ?? '';
                              VetData.email = data[0]['email'] ?? '';
                              VetData.mobileNumber =
                                  data[0]['mobileNumber'] ?? '';
                              VetData.password = data[0]['password'] ?? '';
                              VetData.clinicName = data[0]['clinic'] ?? '';
                              VetData.lat = data[0]['lat'] ?? 0.001;
                              VetData.long = data[0]['long'] ?? 0.001;
                              Get.to(VetProfilePage());
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('No User Found'),
                                    content: Text(
                                        'No user was found with the provided email and password.'),
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
                          } catch (e) {
                            // Handle any errors that might occur during data fetching
                            print('Error fetching data: $e');
                          }
                        }else{
                          print('password ');
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
