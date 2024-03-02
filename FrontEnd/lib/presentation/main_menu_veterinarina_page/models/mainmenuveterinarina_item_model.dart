import '../../../core/app_export.dart';

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
