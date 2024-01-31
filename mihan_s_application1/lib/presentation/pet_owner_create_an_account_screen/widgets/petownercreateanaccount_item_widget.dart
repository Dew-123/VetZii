import '../controller/pet_owner_create_an_account_controller.dart';
import '../models/petownercreateanaccount_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class PetownercreateanaccountItemWidget extends StatelessWidget {
  PetownercreateanaccountItemWidget(
    this.petownercreateanaccountItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  PetownercreateanaccountItemModel petownercreateanaccountItemModelObj;

  var controller = Get.find<PetOwnerCreateAnAccountController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 53.h,
      child: Padding(
        padding: EdgeInsets.only(top: 1.v),
        child: Text(
          "lbl_gender".tr,
          style: theme.textTheme.titleSmall,
        ),
      ),
    );
  }
}
