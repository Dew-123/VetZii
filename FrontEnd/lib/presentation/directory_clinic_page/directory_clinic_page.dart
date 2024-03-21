import '../../dataHandling/data.dart';
import 'models/directory_clinic_model.dart';
import 'widgets/userprofile_item_widget.dart';
import 'controller/directory_clinic_controller.dart';
import 'models/userprofile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';

class DirectoryClinicPage extends StatelessWidget {

  DirectoryClinicPage({Key? key})
      : super(
    key: key,
  );

  DirectoryClinicPageController controller =Get.put(DirectoryClinicPageController(DirectoryClinicPageModel().obs));

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
      height: 637.v,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: _buildUserProfile(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        // Implement search functionality here
      },
    );
  }

  Future<void> _fetchDataFromDatabase() async {
    await controller.directoryClinicPageModelObj.value.fetchDataFromDatabase();
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 47.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 22.h,
          top: 12.v,
          bottom: 17.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitle(
        text: "All Clinics",
      ),
    );
  }

  Widget _buildUserProfile() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          top: 67.v,
          right: 1.h,
        ),
        child: SingleChildScrollView( // Wrap with SingleChildScrollView
          child: Obx(
                () => ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (
                  context,
                  index,
                  ) {
                return SizedBox(
                  height: 19.v,
                );
              },
              itemCount: controller.directoryClinicPageModelObj.value.userprofileItemList.value.length,
              itemBuilder: (context, index) {
                UserprofileItemModel model = controller.directoryClinicPageModelObj.value.userprofileItemList.value[index];
                return UserprofileItemWidget(
                  model,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildFilters() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 19.v),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgSearch,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(
                top: 3.v,
                bottom: 4.v,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: SizedBox(
                height: 31.v,
                child: VerticalDivider(
                  width: 1.h,
                  thickness: 1.v,
                  indent: 3.h,
                  endIndent: 2.h,
                ),
              ),
            ),
            CustomElevatedButton(
              height: 32.v,
              width: 75.h,
              text: "Filters".tr,
              margin: EdgeInsets.only(left: 200.h),
              leftIcon: Container(
                margin: EdgeInsets.only(right: 4.h),
                child: CustomImageView(
                  imagePath: ImageConstant.imgGroup18240,
                  height: 23.adaptSize,
                  width: 23.adaptSize,
                ),
              ),
              buttonStyle: CustomButtonStyles.fillLightGreen,
              buttonTextStyle: theme.textTheme.bodySmall!,
            ),
          ],
        ),
      ),
    );
  }
}
