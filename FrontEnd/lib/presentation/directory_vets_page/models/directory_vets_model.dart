import '../../../core/app_export.dart';
import 'userprofile_item_model.dart';

/// This class defines the variables used in the [directory_vets_page],
/// and is typically used to hold data that is passed between different parts of the application.
class DirectoryVetsModel {

  Rx<List<UserprofileItemModel>> userprofileItemList = Rx([
    UserprofileItemModel(
        userImage: ImageConstant.imgImage81.obs,
        userImage1: ImageConstant.imgImage85.obs,
        userImage2: ImageConstant.imgImage86.obs,
        userText: "veterinarian / SURGEON".obs,
        userText1: "Dr. Scott".obs),
    UserprofileItemModel(
        userText: "veterinarian ".obs, userText1: "Dr. Brown".obs),
    UserprofileItemModel(
        userText: "veterinarian / SURGEON".obs, userText1: "Dr. William".obs),
    UserprofileItemModel(
        userText: "veterinarian / SURGEON".obs, userText1: "Dr. Samson".obs),
    UserprofileItemModel(
        userText: "veterinarian ".obs, userText1: "Dr. Swanson".obs),UserprofileItemModel(
        userImage: ImageConstant.imgImage81.obs,
        userImage1: ImageConstant.imgImage85.obs,
        userImage2: ImageConstant.imgImage86.obs,
        userText: "veterinarian / SURGEON".obs,
        userText1: "Dr. Scott".obs),
    UserprofileItemModel(
        userText: "veterinarian ".obs, userText1: "Dr. Brown".obs),
    UserprofileItemModel(
        userText: "veterinarian / SURGEON".obs, userText1: "Dr. William".obs),
    UserprofileItemModel(
        userText: "veterinarian / SURGEON".obs, userText1: "Dr. Samson".obs),
    UserprofileItemModel(
        userText: "veterinarian ".obs, userText1: "Dr. Swanson".obs)
  ]);





}
