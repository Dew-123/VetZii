import '../../../core/app_export.dart';

/// This class is used in the [userprofile1_item_widget] screen.
class Userprofile1ItemModel {
  Userprofile1ItemModel({
    this.userImage,
    this.userName,
    this.contactInfo,
    this.dogDetails,
    this.id,
  }) {
    userImage = userImage ?? Rx(ImageConstant.imgRectangle4235);
    userName = userName ?? Rx("Bruno");
    contactInfo = contactInfo ?? Rx("123456789");
    dogDetails =
        dogDetails ?? Rx("German Shepherd \n5 months\nContact - 0715486235");
    id = id ?? Rx("");
  }

  Rx<String>? userImage;

  Rx<String>? userName;

  Rx<String>? contactInfo;

  Rx<String>? dogDetails;

  Rx<String>? id;
}
