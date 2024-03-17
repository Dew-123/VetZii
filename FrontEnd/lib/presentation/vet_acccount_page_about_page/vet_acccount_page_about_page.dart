import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/dataHandling/data.dart';
import 'package:mihan_s_application1/http_req/appointment.dart';

class VetAcccountPageAboutPage extends StatelessWidget {
  VetAcccountPageAboutPage({Key? key}) : super(key: key);

  final String fullName = UserData.fullName_vet; // Example data
  final String address = UserData.addressOfTheClinic_vet; // Example data
  final String expertise = UserData.fieldOfExpertise_vet; // Example data
  final String email = UserData.email_vet; // Example data
  final String mobileNumber = UserData.mobileNumber_vet; // Example data
  List<dynamic> pastTreatmentRecords = [];


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          return _buildWithData();
        }
      },
    );
  }

  Future<void> _getData() async {
    var databaseData = await Appointment().getDocTreatmentRecords(UserData.email_vet);
    print('databaseData');
    for (var data in databaseData['pastTreatments']) {
      print(data);
      pastTreatmentRecords.add({
        "date": data['date'],
        "petType": data['pet']['type'],
        "petName": data['pet']['name'],
        "ownerName": data['owner']['name'],
        "description": data['description'],
        "image": data['image']
      });
    }
  }

  Widget _buildWithData() {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 19),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 29),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 19),
                    Text(
                      "Full Name",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      fullName,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Address of the Clinic",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      address,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Field of Expertise",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      expertise,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Email",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      email,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Mobile Number",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      mobileNumber,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Past Treatment Records",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: pastTreatmentRecords.map((record) {
                        return Container(
                          color: Colors.grey[200],
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date: ${record['date']}",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Pet Type: ${record['petType']}",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Pet Name: ${record['petName']}",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Owner Name: ${record['ownerName']}",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Description: ${record['description']}", // Add "Description" label
                                style: TextStyle(fontSize: 16),
                              ),
                              Container(
                                child: Image.memory(
                                      base64Decode(record['image']),
                                      width: 100,
                                      height: 100,
                                    ),
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
