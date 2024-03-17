import '../controller/adoption_and_rehoming_controller.dart';
import '../models/userprofile1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mihan_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class Userprofile1ItemWidget extends StatelessWidget {
  Userprofile1ItemWidget(
      this.userprofile1ItemModelObj, {
        Key? key,
      }) : super(
    key: key,
  );

  final Userprofile1ItemModel userprofile1ItemModelObj;

  final AdoptionAndRehomingController controller = Get.find<AdoptionAndRehomingController>();

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
            Container(
              height: 148.v,
              width: 109.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.h),
                color: Colors.grey[300], // Placeholder color
                // You can use BoxDecoration to apply custom styling like border or shadows if needed
              ),
              child: userprofile1ItemModelObj.userImage != null
                  ? Image.memory(
                userprofile1ItemModelObj.userImage!,
                fit: BoxFit.cover,
              )
                  : Center(
                child: Icon(
                  Icons.image,
                  size: 48,
                  color: Colors.grey[600],
                ),
              ), // Placeholder if image is not available
            ),
            SizedBox(width: 20.h), // Add SizedBox for spacing
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6.v),
                  Text(
                    userprofile1ItemModelObj.userName ?? '',
                    style: CustomTextStyles.titleSmallPoppinsBlack90002Medium,
                  ),
                  SizedBox(height: 2.v),
                  SizedBox(
                    width: 131.h,
                    child: Text(
                      userprofile1ItemModelObj.dogDetails ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  SizedBox(height: 5.v), // Add SizedBox for spacing
                  Text(
                    userprofile1ItemModelObj.contactInfo ?? '', // Assuming contactInfo is a String field
                    style: theme.textTheme.bodySmall,
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
