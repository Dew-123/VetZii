import '../controller/vet_acccount_page_about_controller.dart';
import '../models/tablist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class TablistItemWidget extends StatelessWidget {
  TablistItemWidget(
    this.tablistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TablistItemModel tablistItemModelObj;

  var controller = Get.find<VetAcccountPageAboutController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.h,
      child: Column(
        children: [
          Obx(
            () => CustomIconButton(
              height: 56.adaptSize,
              width: 56.adaptSize,
              padding: EdgeInsets.all(12.h),
              child: CustomImageView(
                imagePath: tablistItemModelObj.grid!.value,
              ),
            ),
          ),
          SizedBox(height: 4.v),
          Obx(
            () => Text(
              tablistItemModelObj.count!.value,
              style: CustomTextStyles.titleSmallInterBluegray700,
            ),
          ),
          SizedBox(height: 7.v),
          Obx(
            () => Text(
              tablistItemModelObj.text!.value,
              style: CustomTextStyles.bodyMediumGray60002,
            ),
          ),
        ],
      ),
    );
  }
}
