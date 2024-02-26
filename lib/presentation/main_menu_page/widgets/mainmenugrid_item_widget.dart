import '../controller/main_menu_controller.dart';
import '../models/mainmenugrid_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class MainmenugridItemWidget extends StatelessWidget {
  MainmenugridItemWidget(
      this.mainmenugridItemModelObj, {
        Key? key,
      }) : super(
    key: key,
  );

  MainmenugridItemModel mainmenugridItemModelObj;

  var controller = Get.find<MainMenuController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 23.h,
        vertical: 16.v, // Adjust vertical padding as necessary
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.v),
          Obx(
                () => CustomImageView(
              imagePath: mainmenugridItemModelObj.findaclinic!.value,
              height: 71.adaptSize,
              width: 71.adaptSize,
            ),
          ),
          SizedBox(height: 8.v), // Adjust spacing if needed
          Obx(
                () => Text(
              mainmenugridItemModelObj.findAClinic!.value,
              style: CustomTextStyles.titleMediumOnPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
