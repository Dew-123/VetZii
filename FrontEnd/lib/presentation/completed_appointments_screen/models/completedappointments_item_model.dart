import '../../../core/app_export.dart';

/// This class is used in the [completedappointments_item_widget] screen.
class CompletedappointmentsItemModel {
  CompletedappointmentsItemModel({
    this.nameOfTheClient,
    this.id,
  }) {
    nameOfTheClient =
        nameOfTheClient ?? Rx("Name of the client\nDate & Time\nPet name");
    id = id ?? Rx("");
  }

  Rx<String>? nameOfTheClient;

  Rx<String>? id;
}
