import '../controller/payment_page_controller.dart';
import '../models/paymentmethods_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class PaymentmethodsItemWidget extends StatelessWidget {
  PaymentmethodsItemWidget(
    this.paymentmethodsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  PaymentmethodsItemModel paymentmethodsItemModelObj;

  var controller = Get.find<PaymentPageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30.h,
        vertical: 18.v,
      ),
      decoration: AppDecoration.outlineBlack900021.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      width: 99.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          Obx(
            () => CustomImageView(
              imagePath: paymentmethodsItemModelObj.paypalImage!.value,
              height: 19.v,
              width: 18.h,
            ),
          ),
          SizedBox(height: 15.v),
          Align(
            alignment: Alignment.centerRight,
            child: Obx(
              () => Text(
                paymentmethodsItemModelObj.paypalText!.value,
                style: theme.textTheme.labelMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
