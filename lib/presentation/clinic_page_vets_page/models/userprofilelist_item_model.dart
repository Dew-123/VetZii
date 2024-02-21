import '../../../core/app_export.dart';

/// This class is used in the [userprofilelist_item_widget] screen.
class UserprofilelistItemModel {
  UserprofilelistItemModel({
    this.userText,
    this.userText1,
    this.id,
  }) {
    userText = userText ?? Rx("veterinarian / SURGEON");
    userText1 = userText1 ?? Rx("Dr. Scott");
    id = id ?? Rx("");
  }

  Rx<String>? userText;

  Rx<String>? userText1;

  Rx<String>? id;
}
