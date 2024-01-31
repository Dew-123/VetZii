import '../../../core/app_export.dart';

/// This class is used in the [userprofile_item_widget] screen.
class UserprofileItemModel {
  UserprofileItemModel({
    this.userImage,
    this.userImage1,
    this.userImage2,
    this.userText,
    this.userText1,
    this.id,
  }) {
    userImage = userImage ?? Rx(ImageConstant.imgImage81);
    userImage1 = userImage1 ?? Rx(ImageConstant.imgImage85);
    userImage2 = userImage2 ?? Rx(ImageConstant.imgImage86);
    userText = userText ?? Rx("veterinarian / SURGEON");
    userText1 = userText1 ?? Rx("Dr. Scott");
    id = id ?? Rx("");
  }

  Rx<String>? userImage;

  Rx<String>? userImage1;

  Rx<String>? userImage2;

  Rx<String>? userText;

  Rx<String>? userText1;

  Rx<String>? id;
}
