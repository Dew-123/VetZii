import '../controller/adoption_and_rehoming_controller.dart';
import '../models/userprofile1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class Userprofile1ItemWidget extends StatelessWidget {
  Userprofile1ItemWidget(
    this.userprofile1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Userprofile1ItemModel userprofile1ItemModelObj;

  var controller = Get.find<AdoptionAndRehomingController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 18.v,
        ),
        decoration: AppDecoration.outlineBlack900022.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => CustomImageView(
                imagePath: userprofile1ItemModelObj.userImage!.value,
                height: 148.v,
                width: 109.h,
                radius: BorderRadius.circular(
                  6.h,
                ),
                margin: EdgeInsets.only(
                  top: 13.v,
                  bottom: 7.v,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 35.h,
                bottom: 69.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6.v),
                  Obx(
                    () => Text(
                      userprofile1ItemModelObj.userName!.value,
                      style: CustomTextStyles.titleSmallPoppinsBlack90002Medium,
                    ),
                  ),
                  SizedBox(height: 2.v),
                  SizedBox(
                    width: 131.h,
                    child: Obx(
                      () => Text(
                        userprofile1ItemModelObj.dogDetails!.value,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.v), // Add SizedBox for spacing
                  Obx(
                        () => Text(
                      userprofile1ItemModelObj.contactInfo!.value, // Assuming contactInfo is a String field
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
