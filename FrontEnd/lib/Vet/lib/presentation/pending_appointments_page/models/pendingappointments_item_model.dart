import 'package:mihan_s_application1/Vet/lib/core/app_export_vet.dart';

/// This class is used in the [pendingappointments_item_widget] screen.
class PendingappointmentsItemModel {
  PendingappointmentsItemModel({
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
