import 'dart:typed_data';

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
    userImage = (userImage ?? ImageConstant.imgRectangle4235) as Uint8List?;
    userName = userName ?? "Bruno";
    contactInfo = contactInfo ?? "123456789";
    dogDetails =
        dogDetails ?? "German Shepherd \n5 months\nContact - 0715486235";
    id = id ?? "";
  }

  Uint8List? userImage;

  String? userName;
  String? contactInfo;

  String? dogDetails;

  String? id;
}
