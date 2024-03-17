import 'dart:convert';

import 'package:http/http.dart' as http;
import 'links.dart';
class Appointment {
  Future<void> bookAppointment(String date, String time, String patientEmail, String petType, String vetEmail) async {
    try {
      // API endpoint
      var url = Uri.parse(Links.bookAppointment);

      // Request body
      var body = {
        'date': date,
        'time': time,
        'patientEmail': patientEmail,
        'petType': petType,
        'vetEmail': vetEmail,
      };
      // Sending POST request
      var response = await http.post(
        url,
        body: body,
      );
      // Checking response status
      if (response.statusCode == 200) {
        print('Appointment booked successfully');
        var responseData = json.decode(response.body);
        print('Inserted ID: ${responseData['insertedId']}');
      } else {
        print('Failed to book appointment. Status code: ${response.statusCode}');
        print('Error: ${response.body}');
      }
    } catch (error) {
      print('Error occurred while calling the API: $error');
    }
  }

}
