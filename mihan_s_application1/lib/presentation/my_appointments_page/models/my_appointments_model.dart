import '../../../core/app_export.dart';
import 'appointmentcard_item_model.dart';

/// This class defines the variables used in the [my_appointments_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MyAppointmentsModel {
  Rx<List<AppointmentcardItemModel>> appointmentcardItemList = Rx([
    AppointmentcardItemModel(
        time: "Jun 30, 2024 - 10.00 AM".obs,
        doctorName: "Dr. Scott Adkins".obs,
        clinicName: "CozyPaws Animal Clinic, \n56 Main Street, Cit".obs),
    AppointmentcardItemModel(
        time: "Feb 15, 2024 - 11.00 AM".obs,
        doctorName: "Dr. James Samson".obs,
        clinicName: "150/A, Elliot Rd, Galle".obs)
  ]);
}
