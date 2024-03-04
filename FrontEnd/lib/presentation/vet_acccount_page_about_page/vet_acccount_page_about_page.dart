import 'widgets/tablist_item_widget.dart';
import 'controller/vet_acccount_page_about_controller.dart';
import 'models/tablist_item_model.dart';
import 'models/vet_acccount_page_about_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';

class VetAcccountPageAboutPage extends StatelessWidget {
  VetAcccountPageAboutPage({Key? key})
      : super(
          key: key,
        );

  VetAcccountPageAboutController controller =
      Get.put(VetAcccountPageAboutController(VetAcccountPageAboutModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 19.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 29.h,
                    right: 21.h,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 19.v),
                      SizedBox(
                        width: 310.h,
                        child: Text(
                          "msg_experience_over".tr,
                          maxLines: 21,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      SizedBox(height: 20.v),
                      Text(
                        "msg_past_treatment_records".tr,
                        style: CustomTextStyles
                            .titleSmallPoppinsBlack90002Medium_1,
                      ),
                      SizedBox(height: 13.v),
                      Container(
                        width: 282.h,
                        margin: EdgeInsets.only(
                          left: 10.h,
                          right: 18.h,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.h,
                          vertical: 7.v,
                        ),
                        decoration: AppDecoration.fillGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 1.v),
                            Container(
                              width: 224.h,
                              margin: EdgeInsets.only(right: 48.h),
                              child: Text(
                                "msg_pet_name_max_species".tr,
                                maxLines: 13,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.labelLargeBlack90002_1
                                    .copyWith(
                                  height: 1.50,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 13.v),
                      Container(
                        width: 282.h,
                        margin: EdgeInsets.only(
                          left: 12.h,
                          right: 16.h,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.h,
                          vertical: 8.v,
                        ),
                        decoration: AppDecoration.fillGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
                        ),
                        child: Container(
                          width: 224.h,
                          margin: EdgeInsets.only(right: 48.h),
                          child: Text(
                            "msg_pet_name_kitty_species".tr,
                            maxLines: 7,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.labelLargeBlack90002_1
                                .copyWith(
                              height: 1.50,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabList() {
    return SizedBox(
      height: 101.v,
      child: Obx(
        () => ListView.separated(
          padding: EdgeInsets.only(
            left: 35.h,
            right: 43.h,
          ),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 23.h,
            );
          },
          itemCount: controller
              .vetAcccountPageAboutModelObj.value.tablistItemList.value.length,
          itemBuilder: (context, index) {
            TablistItemModel model = controller.vetAcccountPageAboutModelObj
                .value.tablistItemList.value[index];
            return TablistItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }
}
