import 'package:mihan_s_application1/Vet/lib/core/app_export_vet.dart';
import 'mainmenuveterinarina_item_model.dart';

/// This class defines the variables used in the [main_menu_veterinarina_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MainMenuVeterinarinaModel {
  Rx<List<MainmenuveterinarinaItemModel>> mainmenuveterinarinaItemList = Rx([
    MainmenuveterinarinaItemModel(
        nameOfTheClient: "Name of the client\nDate & Time\nPet name".obs,
        complete: "Complete".obs),
    MainmenuveterinarinaItemModel(
        nameOfTheClient: "Name of the client\nDate & Time\nPet name".obs,
        complete: "Complete".obs),
    MainmenuveterinarinaItemModel(
        nameOfTheClient: "Name of the client\nDate & Time\nPet name".obs,
        complete: "Complete".obs)
  ]);
}
