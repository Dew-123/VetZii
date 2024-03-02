import '../controller/directory_vets_controller.dart';
import '../models/userprofile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(
    this.userprofileItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofileItemModel userprofileItemModelObj;

  var controller = Get.find<DirectoryVetsController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.all(10.h),
        decoration: AppDecoration.outlineBlueGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder15,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              color: appTheme.orange200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Container(
                height: 92.v,
                width: 79.h,
                decoration: AppDecoration.fillOrange.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Obx(
                          () => CustomImageView(
                        imagePath: userprofileItemModelObj.userImage!.value,
                        height: 92.v,
                        width: 79.h,
                        radius: BorderRadius.circular(
                          10.h,
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 92.v,
                        width: 79.h,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Obx(
                                  () => CustomImageView(
                                imagePath:
                                userprofileItemModelObj.userImage1!.value,
                                height: 92.v,
                                width: 79.h,
                                radius: BorderRadius.circular(
                                  10.h,
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                            Obx(
                                  () => CustomImageView(
                                imagePath:
                                userprofileItemModelObj.userImage2!.value,
                                height: 92.v,
                                width: 79.h,
                                radius: BorderRadius.circular(
                                  10.h,
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 18.h,
                top: 9.v,
                bottom: 35.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                        () => Text(
                      userprofileItemModelObj.userText!.value,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  SizedBox(height: 1.v),
                  Obx(
                        () => Text(
                      userprofileItemModelObj.userText1!.value,
                      style: CustomTextStyles.titleMediumOnErrorContainer,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),onTap: ()=>{
      Get.toNamed(AppRoutes.vetAcccountPageAboutTabContainerScreen)
    });
  }
}
