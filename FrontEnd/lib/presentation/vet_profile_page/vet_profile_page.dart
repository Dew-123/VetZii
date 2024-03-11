import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/dataHandling/vetData.dart';
import 'package:http/http.dart' as http;
import 'package:mihan_s_application1/http_req/links.dart';

import '../vet_location_picker_page/vet_location_picker_page.dart';

class VetProfilePage extends StatefulWidget {
  VetProfilePage({Key? key}) : super(key: key);

  @override
  _VetProfilePageState createState() => _VetProfilePageState();
}

class _VetProfilePageState extends State<VetProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _editMode = false; // Track whether the vet is in edit mode

  // Variables to hold edited values
  late String _editedFullName = '';
  late String _editedAddressClinic = '';
  late String _editedFieldOfExpertise = '';
  late String _editedMobileNumber = '';
  late String _editedEmail = '';
  late String _editedPassword = '';
  late String _editedClinicName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veterinarian Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Add logout functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(ImageConstant.imgEllipse268128x128),
                  ),
                  SizedBox(height: 20),
                  _buildTextFormField("Full name", VetData.fullName),
                  _buildTextFormField("Address of the Clinic", VetData.addressClinic),
                  _buildTextFormField("Field of Expertise", VetData.fieldOfExpertise),
                  _buildTextFormField("Mobile Number", VetData.mobileNumber),
                  _buildTextFormField("Email", VetData.email),
                  _buildTextFormField("Password", VetData.password, obscureText: true),
                  _buildTextFormField("Name of the Clinic", VetData.clinicName),
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapPage()),
                      );

                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 5,vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Locate on Map',style: TextStyle(color: Colors.white,
                            fontSize: 14),),
                        SizedBox(width: 5,),
                        Icon(Icons.location_on),
                      ],
                    )


                  ),
                  SizedBox(height: 10),
                  if (!_editMode)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _editMode = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.lime, // Text color
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25), // Button padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Button border radius
                        ),
                      ),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),




                  if (_editMode)
                    ElevatedButton(
                      onPressed: () {
                        //_saveChanges(); // Function to save changes to database
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.lime, // Text color
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25), // Button padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Button border radius
                        ),
                      ),
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label, String userDataValue, {bool obscureText = false}) {
    return TextFormField(
      initialValue: userDataValue,
      enabled: _editMode, // Enable/disable based on edit mode
      obscureText: obscureText,
      onChanged: (value) {
        // Update edited values as user types
        switch (label) {
          case 'Full name':
            _editedFullName = value;
            break;
          case 'Address of the Clinic':
            _editedAddressClinic = value;
            break;
          case 'Field of Expertise':
            _editedFieldOfExpertise = value;
            break;
          case 'Mobile Number':
            _editedMobileNumber = value;
            break;
          case 'Email':
            _editedEmail = value;
            break;
          case 'Password':
            _editedPassword = value;
            break;
          case 'Name of the Clinic':
            _editedClinicName = value;
            break;
        }
      },
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }

  void _saveChanges() async {
    try {
      final response = await http.post(
        Uri.parse(Links.updateVetData),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'PrevEmail': VetData.email, // Pass the current user's email
          'fullName': _editedFullName.isNotEmpty ? _editedFullName : VetData.fullName,
          'addressClinic': _editedAddressClinic.isNotEmpty ? _editedAddressClinic : VetData.addressClinic,
          'fieldofExpertise': _editedFieldOfExpertise.isNotEmpty ? _editedFieldOfExpertise : VetData.fieldOfExpertise,
          'email': _editedEmail.isNotEmpty ? _editedEmail : VetData.email,
          'password': _editedPassword.isNotEmpty ? _editedPassword : VetData.password,
          'mobilenumber': _editedMobileNumber.isNotEmpty ? _editedMobileNumber : VetData.mobileNumber,
          'clinicname': _editedClinicName.isNotEmpty ? _editedClinicName : VetData.clinicName,
        }),
      );

      if (response.statusCode == 200) {
        // Handle success
        print('Vet profile updated successfully');
      } else {
        // Handle error
        print(response.body);
        print('Failed to update vet profile');
      }
    } catch (error) {
      // Handle error
      print('Error updating vet profile: $error');
    }

    // After saving changes, set edit mode to false
    setState(() {
      _editMode = false;
    });
  }
}