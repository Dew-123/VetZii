import '../../../core/app_export.dart';
import 'pendingappointments_item_model.dart';

/// This class defines the variables used in the [pending_appointments_page],
/// and is typically used to hold data that is passed between different parts of the application.
class PendingAppointmentsModel {
  Rx<List<PendingappointmentsItemModel>> pendingappointmentsItemList = Rx([
    PendingappointmentsItemModel(
        nameOfTheClient: "Name of the client\nDate & Time\nPet name".obs),
    PendingappointmentsItemModel(
        nameOfTheClient: "Name of the client\nDate & Time\nPet name".obs),
    PendingappointmentsItemModel(
        nameOfTheClient: "Name of the client\nDate & Time\nPet name".obs),
    PendingappointmentsItemModel(
        nameOfTheClient: "Name of the client\nDate & Time\nPet name".obs)
  ]);
}
