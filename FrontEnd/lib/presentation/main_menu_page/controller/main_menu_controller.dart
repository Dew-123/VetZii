import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/main_menu_page/models/main_menu_model.dart';

/// A controller class for the MainMenuPage.
///
/// This class manages the state of the MainMenuPage, including the
/// current mainMenuModelObj
class MainMenuController extends GetxController {
  MainMenuController(this.mainMenuModelObj);

  Rx<MainMenuModel> mainMenuModelObj;
}
