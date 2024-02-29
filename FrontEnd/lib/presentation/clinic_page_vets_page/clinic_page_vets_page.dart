import 'widgets/userprofilelist_item_widget.dart';
import 'controller/clinic_page_vets_controller.dart';
import 'models/clinic_page_vets_model.dart';
import 'models/userprofilelist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';

class ClinicPageVetsPage extends StatelessWidget {
  ClinicPageVetsPage({Key? key})
      : super(
          key: key,
        );

  ClinicPageVetsController controller =
      Get.put(ClinicPageVetsController(ClinicPageVetsModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: Column(
            children: [
              SizedBox(height: 17.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(
                  children: [
                    Container(
                      width: 241.h,
                      margin: EdgeInsets.symmetric(horizontal: 43.h),
                      child: Text(
                        "msg_meet_our_team_select".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.labelLargeBlack90002_1,
                      ),
                    ),
                    SizedBox(height: 6.v),
                    _buildUserProfileList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfileList() {
    return Obx(
      () => ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 12.v,
          );
        },
        itemCount: controller
            .clinicPageVetsModelObj.value.userprofilelistItemList.value.length,
        itemBuilder: (context, index) {
          UserprofilelistItemModel model = controller.clinicPageVetsModelObj
              .value.userprofilelistItemList.value[index];
          return UserprofilelistItemWidget(
            model,
          );
        },
      ),
    );
  }
}
