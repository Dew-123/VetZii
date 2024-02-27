import '../../../core/app_export.dart';
import 'mainmenugrid_item_model.dart';

/// This class defines the variables used in the [main_menu_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MainMenuModel {
  Rx<List<MainmenugridItemModel>> mainmenugridItemList = Rx([
    MainmenugridItemModel(
        findaclinic: ImageConstant.location.obs,
        findAClinic: "Find a clinic".obs),
    MainmenugridItemModel(
        findaclinic: ImageConstant.directory.obs,
        findAClinic: "Find a vet".obs),
    MainmenugridItemModel(
        findaclinic: ImageConstant.rehoming.obs,
        findAClinic: "Adopt a pet".obs),
    MainmenugridItemModel(
        findaclinic: ImageConstant.stethascope.obs,
        findAClinic: "Predict the disease".obs)
  ]);
}

