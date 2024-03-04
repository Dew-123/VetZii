import '../../dataHandling/data.dart';
import 'widgets/mainmenugrid_item_widget.dart';
import 'controller/main_menu_controller.dart';
import 'models/main_menu_model.dart';
import 'models/mainmenugrid_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';

class MainMenuPage extends StatelessWidget {
  final String name; // Parameter for the label

  MainMenuPage({Key? key, required this.name}) : super(key: key);

  MainMenuController controller =
      Get.put(MainMenuController(MainMenuModel().obs));

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: Column(
            children: [
              _buildVetZiiTwoStack(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.h,
                  vertical: 19.v,
                ),
                child: Column(
                  children: [
                    Opacity(
                      opacity: 0.8,
                      child: Container(
                        width: 231.h,
                        margin: EdgeInsets.only(
                          left: 36.h,
                          right: 44.h,
                        ),
                        child: Text(
                          "msg_vet_care_predictive".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.titleMediumBlack90002,
                        ),
                      ),
                    ),
                    SizedBox(height: 23.v),
                    _buildMainMenuGrid(),
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
  Widget _buildVetZiiTwoStack() {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.all(0),
      color: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.customBorderBL33,
      ),
      child: Container(
        height: 145.v,
        width: double.maxFinite,
        decoration: AppDecoration.fillPrimary.copyWith(
          borderRadius: BorderRadiusStyle.customBorderBL33,
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgVetzii01,
              height: 135.v,
              width: 133.h,
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 68.h),
            ),
            CustomAppBar(
              height: 59.v,
              title: Container(
                height: 48.300003.v,
                width: 119.h,
                margin: EdgeInsets.only(left: 25.h),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    AppbarSubtitleTwo(
                      text: "lbl_welcome".tr,
                      margin: EdgeInsets.only(
                        left: 2.h,
                        right: 50.h,
                        bottom: 27.v,
                      ),
                    ),
                    AppbarTitle(
                      text: "$name".tr, // Using the parameter here
                      margin: EdgeInsets.only(top: 18.v),
                    ),
                  ],
                ),
              ),
              actions: [
                AppbarTrailingImage(
                  imagePath: ImageConstant.imgIconNotifications,
                  margin: EdgeInsets.fromLTRB(19.h, 1.v, 19.h, 7.v),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMainMenuGrid() {
    return Padding(
      padding: EdgeInsets.only(right: 1.h),
      child: Obx(
        () => GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 201.v,
            crossAxisCount: 2,
            mainAxisSpacing: 20.h,
            crossAxisSpacing: 20.h,
          ),
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller
              .mainMenuModelObj.value.mainmenugridItemList.value.length,
          itemBuilder: (context, index) {
            MainmenugridItemModel model = controller
                .mainMenuModelObj.value.mainmenugridItemList.value[index];
            return MainmenugridItemWidget(model);
          },
        ),
      ),
    );
  }
}
