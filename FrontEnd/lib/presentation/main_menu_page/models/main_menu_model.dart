import '../../../core/app_export.dart';
import 'mainmenugrid_item_model.dart';

/// This class defines the variables used in the [main_menu_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MainMenuModel {
  Rx<List<MainmenugridItemModel>> mainmenugridItemList = Rx([
    (MainmenugridItemModel(
        image: ImageConstant.location.obs,
        string: "Find a clinic".obs)),
    MainmenugridItemModel(
        image: ImageConstant.directory.obs,
        string: "Find a vet".obs),
    MainmenugridItemModel(
        image: ImageConstant.rehoming.obs,
        string: "Adopt a pet".obs),
    MainmenugridItemModel(
        image: ImageConstant.stethascope.obs,
        string: "Predict the disease".obs)
  ]);
}

