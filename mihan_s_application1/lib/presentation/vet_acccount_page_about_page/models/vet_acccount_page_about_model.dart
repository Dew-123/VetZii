import '../../../core/app_export.dart';
import 'tablist_item_model.dart';

/// This class defines the variables used in the [vet_acccount_page_about_page],
/// and is typically used to hold data that is passed between different parts of the application.
class VetAcccountPageAboutModel {
  Rx<List<TablistItemModel>> tablistItemList = Rx([
    TablistItemModel(
        grid: ImageConstant.imgGridPrimary.obs,
        count: "100+".obs,
        text: "patients".obs),
    TablistItemModel(
        grid: ImageConstant.imgLockPrimary.obs,
        count: "5years+".obs,
        text: "experience".obs),
    TablistItemModel(
        grid: ImageConstant.imgSignal.obs,
        count: "4 star".obs,
        text: "rating".obs)
  ]);
}
