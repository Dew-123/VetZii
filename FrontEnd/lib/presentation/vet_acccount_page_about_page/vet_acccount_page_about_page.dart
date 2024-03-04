import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/dataHandling/data.dart';
import 'package:mihan_s_application1/dataHandling/data.dart';

class VetAcccountPageAboutPage extends StatelessWidget {
  VetAcccountPageAboutPage({Key? key}) : super(key: key);

  // Define variables for data
  final String fullName = UserData.fullName_vet; // Example data
  final String address = UserData.addressOfTheClinic_vet; // Example data
  final String expertise = UserData.fieldOfExpertise_vet; // Example data
  final String email = UserData.email_vet; // Example data
  final String mobileNumber = UserData.mobileNumber_vet; // Example data
  final List<Map<String, String>> pastTreatmentRecords = [
    {
      "date": "2023-05-15",
      "petType": "Dog",
      "petName": "Buddy",
      "ownerName": "John Doe",
      "disease": "Fever",
    },
    {
      "date": "2023-06-20",
      "petType": "Cat",
      "petName": "Whiskers",
      "ownerName": "Jane Smith",
      "disease": "Allergy",
    },
    // Add more treatment records as needed
  ];

  @override
  Widget build(BuildContext context) {
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
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: pastTreatmentRecords
                          .map((record) => Container(
                        color: Colors.grey[200], // Add background color to each record
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
                              "Disease: ${record['disease']}",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ))
                          .toList(),
                    ),
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
