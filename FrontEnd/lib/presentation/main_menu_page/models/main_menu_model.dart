import '../../../core/app_export.dart';
import 'mainmenugrid_item_model.dart';

/// This class defines the variables used in the [main_menu_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MainMenuModel {
  Rx<List<MainmenugridItemModel>> mainmenugridItemList = Rx([
    MainmenugridItemModel(
        image: ImageConstant.location.obs,
        text: "Find a clinic".obs,
        onTap: ()=>{Get.toNamed(AppRoutes.clinicPage)}
    ),
    MainmenugridItemModel(
        image: ImageConstant.directory.obs,
        text: "Find a vet".obs,
        onTap: ()=>{Get.toNamed(AppRoutes.clinicPageVetsPage)}
    ),
    MainmenugridItemModel(
        image: ImageConstant.rehoming.obs,
        text: "Adopt a pet".obs,
        onTap: ()=>{Get.toNamed(AppRoutes.adoptionAndRehomingScreen)}
    ),
    MainmenugridItemModel(
        image: ImageConstant.stethascope.obs,
        text: "Predict the disease".obs,
        onTap: ()=>{Get.toNamed(AppRoutes.diseasePredictionStartScreen)}

    )
  ]);
}

