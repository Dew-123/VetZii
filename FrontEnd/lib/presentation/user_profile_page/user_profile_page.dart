import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/dataHandling/data.dart';

class UserProfilePage extends StatefulWidget {
  UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _editMode = false; // Track whether the user is in edit mode

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
                        backgroundColor: Colors.green,
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
                        setState(() {
                          _editMode = false;
                          // Here you can save the edited data
                          _formKey.currentState?.save();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
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
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
