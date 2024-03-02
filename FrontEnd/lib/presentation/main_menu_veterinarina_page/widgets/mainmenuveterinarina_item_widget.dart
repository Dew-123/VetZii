import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mihan_s_application1/core/app_export.dart';

import '../../../theme/app_decoration.dart';
import '../models/mainmenuveterinarina_item_model.dart';
import '../controller/main_menu_veterinarina_controller.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainmenuveterinarinaItemWidget extends StatelessWidget {
  MainmenuveterinarinaItemWidget(
      this.mainmenuveterinarinaItemModelObj, {
        Key? key,
      }) : super(
    key: key,
  );

  MainmenuveterinarinaItemModel mainmenuveterinarinaItemModelObj;

  var controller = Get.find<MainMenuVeterinarinaController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 17.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.outlineErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 137.h,
            margin: EdgeInsets.only(bottom: 5.v),
            child: Obx(
                  () => Text(
                mainmenuveterinarinaItemModelObj.nameOfTheClient!.value,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 71.h,
              top: 11.v,
              bottom: 5.v,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 1.h,
              vertical: 17.v,
            ),
            decoration: AppDecoration.fillLime,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 2.v),
                Obx(
                      () => Text(
                    mainmenuveterinarinaItemModelObj.complete!.value,
                    style: CustomTextStyles.labelLargeErrorContainer,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
