import 'widgets/paymentmethods_item_widget.dart';
import 'controller/payment_page_controller.dart';
import 'models/paymentmethods_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/core/utils/validation_functions.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';
import 'package:mihan_s_application1/widgets/custom_switch.dart';
import 'package:mihan_s_application1/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class PaymentPageScreen extends GetWidget<PaymentPageController> {
  PaymentPageScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.h),
                        child: Text(
                          "msg_select_payment_method".tr,
                          style: CustomTextStyles.titleMediumMedium,
                        ),
                      ),
                    ),
                    SizedBox(height: 7.v),
                    _buildPaymentMethods(),
                    SizedBox(height: 16.v),
                    _buildCard(),
                    SizedBox(height: 16.v),
                    _buildNameField(),
                    SizedBox(height: 4.v),
                    _buildCardNumberField(),
                    SizedBox(height: 4.v),
                    _buildCvvRow(),
                    SizedBox(height: 15.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.h),
                        child: Row(
                          children: [
                            Obx(
                              () => CustomSwitch(
                                margin: EdgeInsets.only(
                                  top: 1.v,
                                  bottom: 2.v,
                                ),
                                value: controller.isSelectedSwitch.value,
                                onChange: (value) {
                                  controller.isSelectedSwitch.value = value;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.h),
                              child: Text(
                                "lbl_save_this_card".tr,
                                style: CustomTextStyles.labelLargeBlack90002_2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 39.v),
                    Text(
                      "lbl_make_a_payment".tr,
                      style: CustomTextStyles.titleSmallPoppinsGray50,
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildConfirmPaymentButton(),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 56.v,
      leadingWidth: 47.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 22.h,
          top: 11.v,
          bottom: 19.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitle(
        text: "lbl_payment".tr,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgNotification,
          margin: EdgeInsets.fromLTRB(20.h, 18.v, 20.h, 15.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildPaymentMethods() {
    return SizedBox(
      height: 90.v,
      child: Obx(
        () => ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 19.h,
            );
          },
          itemCount: controller
              .paymentPageModelObj.value.paymentmethodsItemList.value.length,
          itemBuilder: (context, index) {
            PaymentmethodsItemModel model = controller
                .paymentPageModelObj.value.paymentmethodsItemList.value[index];
            return PaymentmethodsItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.roundedBorder10,
        image: DecorationImage(
          image: fs.Svg(
            ImageConstant.imgCard,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.h,
          vertical: 9.v,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ImageConstant.imgGroup13,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30.v,
                    width: 53.h,
                    margin: EdgeInsets.only(top: 4.v),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 30.adaptSize,
                            width: 30.adaptSize,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.onError,
                              borderRadius: BorderRadius.circular(
                                15.h,
                              ),
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: 0.8,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: 30.adaptSize,
                              width: 30.adaptSize,
                              decoration: BoxDecoration(
                                color: appTheme.red500A2,
                                borderRadius: BorderRadius.circular(
                                  15.h,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgGroup138,
                    height: 9.v,
                    width: 2.h,
                    margin: EdgeInsets.only(bottom: 24.v),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10.h,
                  right: 29.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.v),
                      child: Text(
                        "lbl_xxxx".tr,
                        style: CustomTextStyles.titleMediumGray50,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 1.h,
                        top: 10.v,
                      ),
                      child: Text(
                        "lbl_xxxx".tr,
                        style: CustomTextStyles.titleMediumGray50,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 1.h,
                        top: 10.v,
                      ),
                      child: Text(
                        "lbl_xxxx".tr,
                        style: CustomTextStyles.titleMediumGray50,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 1.h,
                        top: 9.v,
                      ),
                      child: Text(
                        "lbl_8790".tr,
                        style: CustomTextStyles.titleMediumGray50,
                      ),
                    ),
                    Spacer(),
                    CustomImageView(
                      imagePath: ImageConstant.imgLightBulb,
                      height: 17.adaptSize,
                      width: 17.adaptSize,
                      margin: EdgeInsets.only(bottom: 19.v),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 45.v),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_card_holder".tr.toUpperCase(),
                        style: CustomTextStyles.labelMediumGray50,
                      ),
                      Text(
                        "lbl_james_brown".tr.toUpperCase(),
                        style: CustomTextStyles.labelLargeGray50,
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    height: 29.v,
                    width: 47.h,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "lbl_expires".tr.toUpperCase(),
                            style: CustomTextStyles.labelMediumGray50,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "lbl_01_25".tr.toUpperCase(),
                            style: CustomTextStyles.labelLargeGray50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgThumbsUpAmber300,
                    height: 12.adaptSize,
                    width: 12.adaptSize,
                    margin: EdgeInsets.only(
                      left: 5.h,
                      bottom: 16.v,
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

  /// Section Widget
  Widget _buildNameField() {
    return CustomTextFormField(
      controller: controller.nameFieldController,
      hintText: "msg_name_on_the_card".tr,
      prefix: Container(
        margin: EdgeInsets.fromLTRB(15.h, 16.v, 18.h, 16.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgLockGray500,
          height: 21.adaptSize,
          width: 21.adaptSize,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 53.v,
      ),
      validator: (value) {
        if (!isText(value)) {
          return "err_msg_please_enter_valid_text".tr;
        }
        return null;
      },
      contentPadding: EdgeInsets.only(
        top: 16.v,
        right: 30.h,
        bottom: 16.v,
      ),
      borderDecoration: TextFormFieldStyleHelper.fillGrayTL5,
      fillColor: appTheme.gray50,
    );
  }

  /// Section Widget
  Widget _buildCardNumberField() {
    return CustomTextFormField(
      controller: controller.cardNumberFieldController,
      hintText: "lbl_card_number".tr,
      textInputType: TextInputType.number,
      prefix: Container(
        margin: EdgeInsets.fromLTRB(13.h, 19.v, 18.h, 18.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgTelevision,
          height: 15.v,
          width: 23.h,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 53.v,
      ),
      validator: (value) {
        if (!isNumeric(value)) {
          return "err_msg_please_enter_valid_number".tr;
        }
        return null;
      },
      contentPadding: EdgeInsets.only(
        top: 16.v,
        right: 30.h,
        bottom: 16.v,
      ),
      borderDecoration: TextFormFieldStyleHelper.fillGrayTL5,
      fillColor: appTheme.gray50,
    );
  }

  /// Section Widget
  Widget _buildCvvField() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: CustomTextFormField(
          controller: controller.cvvFieldController,
          hintText: "lbl_cvv".tr,
          textInputAction: TextInputAction.done,
          prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 16.v, 22.h, 16.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgLocation,
              height: 20.v,
              width: 15.h,
            ),
          ),
          prefixConstraints: BoxConstraints(
            maxHeight: 53.v,
          ),
          contentPadding: EdgeInsets.only(
            top: 16.v,
            right: 30.h,
            bottom: 16.v,
          ),
          borderDecoration: TextFormFieldStyleHelper.fillGrayTL5,
          fillColor: appTheme.gray50,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCvvRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 2.h),
            padding: EdgeInsets.symmetric(vertical: 16.v),
            decoration: AppDecoration.fillGray50.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgCalendar1,
                  height: 19.adaptSize,
                  width: 19.adaptSize,
                ),
                Text(
                  "lbl_month_year".tr,
                  style: CustomTextStyles.titleSmallPoppinsBluegray400,
                ),
              ],
            ),
          ),
        ),
        _buildCvvField(),
      ],
    );
  }

  /// Section Widget
  Widget _buildConfirmPaymentButton() {
    return CustomElevatedButton(
      text: "lbl_confirm_payment".tr,
      margin: EdgeInsets.only(
        left: 50.h,
        right: 49.h,
        bottom: 42.v,
      ),
    );
  }
}
