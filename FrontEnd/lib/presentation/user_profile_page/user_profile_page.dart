import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/dataHandling/data.dart';
import 'package:http/http.dart' as http;
import 'package:mihan_s_application1/http_req/links.dart';

class UserProfilePage extends StatefulWidget {
  UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _editMode = false; // Track whether the user is in edit mode

  // Variables to hold edited values
  late String _editedFirstName = '';
  late String _editedLastName = '';
  late String _editedPetName = '';
  late String _editedPetType = '';
  late String _editedGender = '';
  late String _editedEmail = '';
  late String _editedMobileNumber = '';
  late String _editedPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
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
                    backgroundImage: AssetImage(ImageConstant.imgEllipse268),
                  ),
                  SizedBox(height: 20),
                  _buildTextFormField("First name", UserData.firstName),
                  _buildTextFormField("Last name", UserData.lastName),
                  _buildTextFormField("Name of the Pet", UserData.petName),
                  _buildTextFormField("Pet type", UserData.petType),
                  _buildTextFormField("Gender", UserData.gender),
                  _buildTextFormField("Email", UserData.email),
                  _buildTextFormField("Mobile number", UserData.mobileNumber),
                  _buildTextFormField("Password", UserData.password, obscureText: true),
                  SizedBox(height: 20),
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
                          fontSize: 14,
                        ),
                      ),
                    ),
                  if (_editMode)
                    ElevatedButton(
                      onPressed: () {
                        _saveChanges(); // Function to save changes to database
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
                          fontSize: 14,
                        ),
                      ),
                    ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.red, // Text color
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Button border radius
                      ),
                    ),
                    child: Text(
                      'Delete Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
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
          case 'First name':
            _editedFirstName = value;
            break;
          case 'Last name':
            _editedLastName = value;
            break;
          case 'Name of the Pet':
            _editedPetName = value;
            break;
          case 'Pet type':
            _editedPetType = value;
            break;
          case 'Gender':
            _editedGender = value;
            break;
          case 'Email':
            _editedEmail = value;
            break;
          case 'Mobile number':
            _editedMobileNumber = value;
            break;
          case 'Password':
            _editedPassword = value;
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
        Uri.parse(Links.updateUserData),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'PrevEmail': UserData.email, // Pass the current user's email
          'Fname': _editedFirstName.isNotEmpty ? _editedFirstName : UserData.firstName,
          'Lname': _editedLastName.isNotEmpty ? _editedLastName : UserData.lastName,
          'nameOfThePet': _editedPetName.isNotEmpty ? _editedPetName : UserData.petName,
          'petType': _editedPetType.isNotEmpty ? _editedPetType : UserData.petType,
          'gender': _editedGender.isNotEmpty ? _editedGender : UserData.gender,
          'email': _editedEmail.isNotEmpty ? _editedEmail : UserData.email,
          'mobileNumber': _editedMobileNumber.isNotEmpty ? _editedMobileNumber : UserData.mobileNumber,
          'password': _editedPassword.isNotEmpty ? _editedPassword : UserData.password,
        }),
      );

      if (response.statusCode == 200) {
        // Handle success
        print('User profile updated successfully');
      } else {
        // Handle error
        print(response.body);
        print('Failed to update user profile');
      }
    } catch (error) {
      // Handle error
      print('Error updating user profile: $error');
    }

    // After saving changes, set edit mode to false
    setState(() {
      _editMode = false;
    });
  }
}
