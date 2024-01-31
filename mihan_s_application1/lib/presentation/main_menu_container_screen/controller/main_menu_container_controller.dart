import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/main_menu_container_screen/models/main_menu_container_model.dart';

/// A controller class for the MainMenuContainerScreen.
///
/// This class manages the state of the MainMenuContainerScreen, including the
/// current mainMenuContainerModelObj
class MainMenuContainerController extends GetxController {
  Rx<MainMenuContainerModel> mainMenuContainerModelObj =
      MainMenuContainerModel().obs;
}
