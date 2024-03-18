import '../../../core/app_export.dart';
import 'userprofilelist_item_model.dart';


class ClinicPageVetsModel {
  Rx<List<UserprofilelistItemModel>> userprofilelistItemList = Rx([
    UserprofilelistItemModel(
        userText: "veterinarian / SURGEON".obs, userText1: "Dr. Scott".obs),
    UserprofilelistItemModel(
        userText: "veterinarian / SURGEON".obs, userText1: "Dr. Samson".obs),
    UserprofilelistItemModel(
        userText: "veterinarian ".obs, userText1: "Dr. Angela".obs)
  ]);
}
