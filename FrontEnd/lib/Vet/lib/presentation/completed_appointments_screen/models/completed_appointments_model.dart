import 'package:mihan_s_application1/Vet/lib/core/app_export_vet.dart';
import 'completedappointments_item_model.dart';

/// This class defines the variables used in the [completed_appointments_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CompletedAppointmentsModel {
  Rx<List<CompletedappointmentsItemModel>> completedappointmentsItemList = Rx([
    CompletedappointmentsItemModel(
        nameOfTheClient: "Name of the client\nDate & Time\nPet name".obs),
    CompletedappointmentsItemModel(
        nameOfTheClient: "Name of the client\nDate & Time\nPet name".obs),
    CompletedappointmentsItemModel(
        nameOfTheClient: "Name of the client\nDate & Time\nPet name".obs),
    CompletedappointmentsItemModel(
        nameOfTheClient: "Name of the client\nDate & Time\nPet name".obs)
  ]);
}
