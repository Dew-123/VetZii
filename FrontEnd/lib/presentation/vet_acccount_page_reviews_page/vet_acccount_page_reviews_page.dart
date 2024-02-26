import 'controller/vet_acccount_page_reviews_controller.dart';
import 'models/vet_acccount_page_reviews_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/widgets/custom_rating_bar.dart';
import 'package:mihan_s_application1/widgets/custom_text_form_field.dart';

class VetAcccountPageReviewsPage extends StatelessWidget {
  VetAcccountPageReviewsPage({Key? key})
      : super(
          key: key,
        );

  VetAcccountPageReviewsController controller = Get.put(
      VetAcccountPageReviewsController(VetAcccountPageReviewsModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 7.h,
                          right: 70.h,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "msg_add_a_public_review".tr,
                              style: theme.textTheme.bodySmall,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 29.h,
                                bottom: 3.v,
                              ),
                              child: CustomRatingBar(
                                initialRating: 5,
                                itemSize: 13,
                                itemCount: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.v),
                      _buildReviewStack(),
                      SizedBox(height: 14.v),
                      _buildReviewRow(),
                      SizedBox(height: 11.v),
                      _buildReviewRow1(),
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
  Widget _buildReviewStack() {
    return SizedBox(
      height: 176.v,
      width: 313.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgLock34x34,
            height: 34.adaptSize,
            width: 34.adaptSize,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 13.v),
          ),
          CustomTextFormField(
            width: 308.h,
            controller: controller.reviewTwoController,
            hintText: "lbl_enter_here".tr,
            hintStyle: CustomTextStyles.bodySmallBlack90002,
            textInputAction: TextInputAction.done,
            alignment: Alignment.topCenter,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 7.h,
              vertical: 5.v,
            ),
            borderDecoration: TextFormFieldStyleHelper.outlineBlackTL5,
            fillColor: theme.colorScheme.onPrimaryContainer,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(left: 45.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: _buildAngelinaZolly(
                      userName: "msg_samantha_reynolds".tr,
                      counterText: "lbl_12_dec".tr,
                    ),
                  ),
                  SizedBox(height: 2.v),
                  CustomRatingBar(
                    initialRating: 0,
                  ),
                  SizedBox(height: 3.v),
                  Container(
                    width: 249.h,
                    margin: EdgeInsets.only(
                      left: 1.h,
                      right: 16.h,
                    ),
                    child: Text(
                      "msg_dr_scott_is_fantastic".tr,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall!.copyWith(
                        height: 1.50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildReviewRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgLock34x34,
          height: 34.adaptSize,
          width: 34.adaptSize,
          margin: EdgeInsets.only(bottom: 51.v),
        ),
        Padding(
          padding: EdgeInsets.only(left: 11.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: _buildAngelinaZolly(
                  userName: "lbl_angelina_zolly".tr,
                  counterText: "lbl_25_dec".tr,
                ),
              ),
              SizedBox(height: 2.v),
              CustomRatingBar(
                initialRating: 0,
              ),
              SizedBox(height: 7.v),
              Container(
                width: 253.h,
                margin: EdgeInsets.only(
                  left: 1.h,
                  right: 11.h,
                ),
                child: Text(
                  "msg_dr_scott_is_a_compassionate".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall!.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildReviewRow1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgLock34x34,
          height: 34.adaptSize,
          width: 34.adaptSize,
          margin: EdgeInsets.only(bottom: 57.v),
        ),
        Padding(
          padding: EdgeInsets.only(left: 11.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: _buildAngelinaZolly(
                  userName: "lbl_zenifero_bolex".tr,
                  counterText: "lbl_1_jan".tr,
                ),
              ),
              SizedBox(height: 3.v),
              CustomRatingBar(
                initialRating: 0,
                itemCount: 3,
              ),
              SizedBox(height: 7.v),
              Container(
                width: 259.h,
                margin: EdgeInsets.only(
                  left: 1.h,
                  right: 6.h,
                ),
                child: Text(
                  "msg_dr_scott_is_amazing".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall!.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildAngelinaZolly({
    required String userName,
    required String counterText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(
            userName,
            style: CustomTextStyles.titleSmallPoppinsBlack90002Medium.copyWith(
              color: appTheme.black90002,
            ),
          ),
        ),
        Text(
          counterText,
          style: CustomTextStyles.titleSmallPoppinsBluegray200.copyWith(
            color: appTheme.blueGray200,
          ),
        ),
      ],
    );
  }
}
