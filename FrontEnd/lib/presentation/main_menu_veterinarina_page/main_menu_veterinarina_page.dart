import 'package:mihan_s_application1/core/app_export.dart';
import '../../widgets/custom_elevated_button_vet.dart';
import 'widgets/mainmenuveterinarina_item_widget.dart';
import 'models/mainmenuveterinarina_item_model.dart';
import 'package:flutter/material.dart';
import 'controller/main_menu_veterinarina_controller.dart';
import 'models/main_menu_veterinarina_model.dart';

class MainMenuVeterinarinaPage extends StatelessWidget {
  MainMenuVeterinarinaPage({Key? key})
      : super(
    key: key,
  );

  MainMenuVeterinarinaController controller =
  Get.put(MainMenuVeterinarinaController(MainMenuVeterinarinaModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: Column(
            children: [
              _buildThree(),
              SizedBox(height: 17.v),
              CustomElevatedButton(
                height: 47.v,
                text: "msg_scheduled_appointments".tr,
                margin: EdgeInsets.only(
                  left: 35.h,
                  right: 36.h,
                ),
                buttonStyle: CustomButtonStyles.fillLime,
              ),
              SizedBox(height: 22.v),
              _buildMainmenuveterinarina(),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildThree() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 25.h),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.customBorderBL33,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 11.v,
              bottom: 85.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Text(
                    "lbl_welcome".tr,
                    style: CustomTextStyles.bodyMedium14,
                  ),
                ),
                Text(
                  "lbl_dr_fernando".tr,
                  style: theme.textTheme.titleLarge,
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgVetzii01,
            height: 145.v,
            width: 133.h,
            margin: EdgeInsets.only(left: 3.h),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildMainmenuveterinarina() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Obx(
            () => ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
              context,
              index,
              ) {
            return SizedBox(
              height: 22.v,
            );
          },
          itemCount: controller.mainMenuVeterinarinaModelObj.value
              .mainmenuveterinarinaItemList.value.length,
          itemBuilder: (context, index) {
            MainmenuveterinarinaItemModel model = controller
                .mainMenuVeterinarinaModelObj
                .value
                .mainmenuveterinarinaItemList
                .value[index];
            return MainmenuveterinarinaItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }
}
