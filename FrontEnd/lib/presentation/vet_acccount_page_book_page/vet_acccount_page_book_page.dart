import 'package:mihan_s_application1/presentation/directory_vets_page/models/userprofile_item_model.dart';

import 'controller/vet_acccount_page_book_controller.dart';
import 'models/vet_acccount_page_book_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';


class VetAcccountPageBookPage extends StatelessWidget {


  VetAcccountPageBookPage(  {Key? key})
      : super(
          key: key,
        );

  VetAcccountPageBookController controller =
      Get.put(VetAcccountPageBookController(VetAcccountPageBookModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: Column(
            children: [
              SizedBox(height: 28.v),
              _buildBookAppointment(),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildWorkingTimeMonday() {
    return SizedBox(
      width: 294.h,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "lbl_working_time".tr,
              style: CustomTextStyles.titleSmallPoppinsff000000,
            ),
            TextSpan(
              text: "msg_monday".tr,
              style: CustomTextStyles.bodySmallff000000,
            ),
            TextSpan(
              text: "msg_tuesday".tr,
              style: CustomTextStyles.bodySmallff000000.copyWith(
                height: 1.79,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  /// Section Widget
  Widget _buildBookAppointment() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 33.h),
      child: Column(
        children: [
          _buildWorkingTimeMonday(),
          SizedBox(height: 140.v),
          CustomElevatedButton(
            text: "msg_book_appointment".tr,
            margin: EdgeInsets.only(
              left: 18.h,
              right: 15.h,
            ),
            onPressed: ()=>{
              Get.toNamed(AppRoutes.bookAppointmentScreen )
            },
          ),
        ],
      ),
    );
  }
}
