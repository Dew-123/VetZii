import 'widgets/userprofile_item_widget.dart';
import 'controller/directory_vets_controller.dart';
import 'models/directory_vets_model.dart';
import 'models/userprofile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';
import 'package:mihan_s_application1/http_req/serverHandling.dart';

class DirectoryVetsPage extends StatelessWidget {
  DirectoryVetsPage({Key? key})
      : super(
    key: key,
  );

  //DirectoryVetsController controller =Get.put(DirectoryVetsController(DirectoryVetsModel().obs));

  // Initialize userprofileItemList as RxList<UserprofileItemModel>
  List<UserprofileItemModel> userprofileItemList = <UserprofileItemModel>[].obs;

  @override
  Widget build(BuildContext context) {
    _buildVets();// this need to wait until its complete

    //wait until _buildVets
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          height: 637.v,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              _buildUserProfile(),
              Align(
                alignment: Alignment.topLeft,
                child: Opacity(
                  opacity: 0.3,
                  child: Container(
                    width: 94.h,
                    margin: EdgeInsets.only(
                      left: 46.h,
                      top: 17.v,
                    ),
                    child: Text(
                      "lbl_search".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                ),
              ),
              _buildFilters(),
            ],
          ),
        ),
      ),
    );
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
        text: "msg_all_veterinarians".tr,
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
            itemCount: userprofileItemList.length,
            itemBuilder: (context, index) {
              UserprofileItemModel model = userprofileItemList[index];
              return UserprofileItemWidget(
                model,
              );
            },
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
              text: "lbl_filters".tr,
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

  void _buildVets() async {
    ServerHandling serverHandling = ServerHandling();

    try {
      List<dynamic> dataSet = await serverHandling.fetchVetsData();

      for (var data in dataSet) {
        print(data['fieldOfExpertise']);
        print(data['fullName']);

        // userprofileItemList.add(new UserprofileItemModel(
        //   userText: data['fieldOfExpertise'],
        //   userText1: data['fullName'],
        // ));

      }
    } catch (e) {
      print("Error fetching vets data: $e");
      // Handle error appropriately, like showing a message to the user
    }
  }
}
