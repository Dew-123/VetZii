import 'package:mihan_s_application1/Vet/lib/core/app_export_vet.dart';

/// This class is used in the [mainmenuveterinarina_item_widget] screen.
class MainmenuveterinarinaItemModel {
  MainmenuveterinarinaItemModel({
    this.nameOfTheClient,
    this.complete,
    this.id,
  }) {
    nameOfTheClient =
        nameOfTheClient ?? Rx("Name of the client\nDate & Time\nPet name");
    complete = complete ?? Rx("Complete");
    id = id ?? Rx("");
  }

  Rx<String>? nameOfTheClient;

  Rx<String>? complete;

  Rx<String>? id;
}
