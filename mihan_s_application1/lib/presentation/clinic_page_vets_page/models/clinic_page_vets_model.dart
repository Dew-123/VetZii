import '../../../core/app_export.dart';
import 'userprofilelist_item_model.dart';

/// This class defines the variables used in the [clinic_page_vets_page],
/// and is typically used to hold data that is passed between different parts of the application.
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
