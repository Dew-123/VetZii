import 'package:flutter/cupertino.dart';
import 'widgets/userprofile1_item_widget.dart';
import 'controller/adoption_and_rehoming_controller.dart';
import 'models/userprofile1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/clinic_map_page/clinic_map_page.dart';
import 'package:mihan_s_application1/presentation/my_appointments_page/my_appointments_page.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mihan_s_application1/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class AdoptionAndRehomingScreen
    extends GetWidget<AdoptionAndRehomingController> {
  const AdoptionAndRehomingScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: FutureBuilder<void>(
          future: _fetchDataFromDatabase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return _buildBody();
            }
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      height: 635.v,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 14.h),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          GestureDetector(
            child: CustomImageView(
              imagePath: ImageConstant.imgSettingsBlack90002,
              height: 40.adaptSize,
              width: 40.adaptSize,
              alignment: Alignment.topRight,
              onTap: () => {Get.toNamed(AppRoutes.rehomingFormScreen)},
            ),
          ),
          _buildUserProfile(),
        ],
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
        text: "Adopt or Find a Home".tr,
      ),
    );
  }
  Future<void> _fetchDataFromDatabase() async {
    await controller.adoptionAndRehomingModelObj.value.fetchDataFromDatabase();
  }
  /// Section Widget
  Widget _buildUserProfile() {

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 5.h,
          top: 60.v,
          right: 4.h,
        ),
        child: Obx(
              () => ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
                context,
                index,
                ) {
              return SizedBox(
                height: 21.v,
              );
            },
            itemCount: controller.adoptionAndRehomingModelObj.value
                .userprofile1ItemList.value.length,
            itemBuilder: (context, index) {
              Userprofile1ItemModel model = controller
                  .adoptionAndRehomingModelObj
                  .value
                  .userprofile1ItemList
                  .value[index];
              return Userprofile1ItemWidget(
                model,
              );
            },
          ),
        ),
      ),
    );
  }
}
