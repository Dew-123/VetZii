import '../../../core/app_export.dart';
import '../models/main_menu_veterinarina_model.dart';

/// A controller class for the MainMenuVeterinarinaPage.
///
/// This class manages the state of the MainMenuVeterinarinaPage, including the
/// current mainMenuVeterinarinaModelObj
class MainMenuVeterinarinaController extends GetxController {
  MainMenuVeterinarinaController(this.mainMenuVeterinarinaModelObj);

  Rx<MainMenuVeterinarinaModel> mainMenuVeterinarinaModelObj;
}
