import 'package:mihan_s_application1/Vet/lib/core/app_export_vet.dart';
import '../models/main_menu_veterinarina_model.dart';

/// A controller class for the MainMenuVeterinarinaPage.
///
/// This class manages the state of the MainMenuVeterinarinaPage, including the
/// current mainMenuVeterinarinaModelObj
class MainMenuVeterinarinaController extends GetxController {
  MainMenuVeterinarinaController(this.mainMenuVeterinarinaModelObj);

  Rx<MainMenuVeterinarinaModel> mainMenuVeterinarinaModelObj;
}
