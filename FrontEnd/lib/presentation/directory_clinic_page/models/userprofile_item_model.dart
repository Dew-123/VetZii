import 'package:flutter/widgets.dart';
import '../../../core/app_export.dart';

class UserprofileItemModel {
  UserprofileItemModel({
    this.userImage,
    this.userImage1,
    this.userImage2,
    this.fullName,
    this.addressOfTheClinic,
    this.fieldOfExpertise,
    this.email,
    this.mobileNumber,
    this.password,
    this.id,
    this.clinic,//vet data
  }) {
    userImage = userImage ?? Rx(ImageConstant.imgImage81);
    userImage1 = userImage1 ?? Rx(ImageConstant.imgImage85);
    userImage2 = userImage2 ?? Rx(ImageConstant.imgImage86);
    fullName = fullName ?? Rx("");
    addressOfTheClinic = addressOfTheClinic ?? Rx("");
    fieldOfExpertise = fieldOfExpertise ?? Rx("");
    email = email ?? Rx("");
    mobileNumber = mobileNumber ?? Rx("");
    password = password ?? Rx("");
    id = id ?? Rx("");
    clinic=clinic??Rx("");
  }

  Rx<String>? userImage;
  Rx<String>? userImage1;
  Rx<String>? userImage2;
  Rx<String>? fullName;
  Rx<String>? addressOfTheClinic;
  Rx<String>? fieldOfExpertise;
  Rx<String>? email;
  Rx<String>? mobileNumber;
  Rx<String>? password;
  Rx<String>? id;
  Rx<String>? clinic;
  VoidCallback? onTap;
}
