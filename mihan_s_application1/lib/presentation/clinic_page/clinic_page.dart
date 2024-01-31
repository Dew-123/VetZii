import 'controller/clinic_controller.dart';
import 'models/clinic_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';

class ClinicPage extends StatelessWidget {
  ClinicPage({Key? key})
      : super(
          key: key,
        );

  ClinicController controller = Get.put(ClinicController(ClinicModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: Column(
            children: [
              SizedBox(height: 23.v),
              _buildWelcomeSection(),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildWelcomeSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 31.h),
      child: Column(
        children: [
          SizedBox(
            width: 297.h,
            child: Text(
              "msg_welcome_to_petcare".tr,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall,
            ),
          ),
          SizedBox(height: 17.v),
          Text(
            "msg_open_mon_sat".tr,
            style: CustomTextStyles.bodySmallLightgreen700,
          ),
          SizedBox(height: 15.v),
          SizedBox(
            width: 143.h,
            child: Text(
              "msg_services_offered".tr,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
