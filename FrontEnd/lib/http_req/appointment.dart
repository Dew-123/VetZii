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

  Future<dynamic> getDocTreatmentRecords(String docEmail) async {
    try {
      // API endpoint for treatment records
      var url = Uri.parse(Links.getPastTreatments);

      // Request body
      var body = {
        'doctorEmail': docEmail,
      };

      // Sending POST request
      var response = await http.post(
        url,
        body: body,
      );

      // Checking response status
      if (response.statusCode == 200) {
        print('Treatment records retrieved successfully');
        return json.decode(response.body);
      } else {
        print('Failed to retrieve treatment records. Status code: ${response.statusCode}');
        print('Error: ${response.body}');
        // You might want to throw an exception here to propagate the error.
        throw Exception('Failed to retrieve treatment records. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred while calling the API: $error');
      // You might want to throw an exception here to propagate the error.
      throw Exception('Error occurred while calling the API: $error');
    }
  }

  Future<dynamic> addPastTreatments( String email,String date,String ownerName ,String petName ,String petType,String description,String image) async {
    try {
      // API endpoint for adding past treatments
      var url = Uri.parse(Links.addPastTreatments);

      // Request body
      var body = {
        'email':email,
        'date': date,
        'ownerName': ownerName,
        'petName': petName,
        'petType': petType,
        'description': description,
        'image': image,
      };

      // Sending POST request
      var response = await http.post(
        url,
        body: body,
      );

      // Checking response status
      if (response.statusCode == 200) {
        print('Treatment record added successfully');
        return json.decode(response.body);
      } else {
        print('Failed to add treatment record. Status code: ${response.statusCode}');
        print('Error: ${response.body}');
        // You might want to throw an exception here to propagate the error.
        throw Exception('Failed to add treatment record. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred while calling the API: $error');
      // You might want to throw an exception here to propagate the error.
      throw Exception('Error occurred while calling the API: $error');
    }
  }

}
