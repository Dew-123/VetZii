import 'package:intl/intl.dart';
import 'package:mihan_s_application1/dataHandling/data.dart';

import '../../../core/app_export.dart';
import '../../../http_req/serverHandling.dart';
import 'appointmentcard_item_model.dart';


class MyAppointmentsModel {
  Rx<List<AppointmentcardItemModel>> appointmentcardItemList = Rx([]);


  Future<void> fetchDataFromDatabase() async {

    List<dynamic> databaseData = await fetchFromDatabase();
    for (var data in databaseData) {
      print( data["appointment"]["dateTime"]);

      print(data["vet"][0]["fullName"]);
      print(data["vet"][0]["addressOfTheClinic"]);

      Rx<String> time = Rx(data["appointment"]["dateTime"]);
      Rx<String> doctorName = Rx(data["vet"][0]["fullName"]);
      Rx<String> clinicName = Rx(data["vet"][0]["addressOfTheClinic"]);

      AppointmentcardItemModel userModel = AppointmentcardItemModel(
        time: time,
        doctorName: doctorName,
        clinicName: clinicName,
      );
      appointmentcardItemList.value.add(userModel);
    }
  }

  Future<List<dynamic>> fetchFromDatabase() async {
    ServerHandling serverHandling = ServerHandling();
    try {
      List<dynamic> dataSet = await serverHandling.fetchAppointments(UserData.email);
      return dataSet;
    } catch (e) {
      print("Error fetching vets data: $e");
      return [];
    }
  }



  String formatDate(String inputDateString) {
    // Parse the input string into a DateTime object
    DateTime dateTime = DateTime.parse(inputDateString);

    // Format the DateTime object into the desired format
    String formattedString = DateFormat("MMM d, yyyy - hh:mm a").format(dateTime);

    // Return the formatted string
    return formattedString;
  }





}