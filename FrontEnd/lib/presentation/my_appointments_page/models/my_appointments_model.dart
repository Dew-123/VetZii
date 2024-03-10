import '../../../core/app_export.dart';
import '../../../http_req/serverHandling.dart';
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


  Future<void> fetchDataFromDatabase() async {

    List<dynamic> databaseData = await fetchFromDatabase();

    appointmentcardItemList.value = [];

    for (var data in databaseData) {

      AppointmentcardItemModel userModel = (AppointmentcardItemModel(
      ));
      appointmentcardItemList.value.add(userModel);
    }
  }


  Future<List<dynamic>> fetchFromDatabase() async {
    ServerHandling serverHandling = ServerHandling();

    try {
      List<dynamic> dataSet = await serverHandling.fetchAppointments();
      return dataSet;
    } catch (e) {
      print("Error fetching vets data: $e");

      return [];
    }
  }
}
