import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';


class UserProfilePage extends StatelessWidget {
  UserProfilePage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


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
                  _buildTextFormField("First name", "John"),
                  _buildTextFormField("Last name", "Doe"),
                  _buildTextFormField("Name of thePet", "Buddy"),
                  _buildTextFormField("Pet type", "dog"),
                  _buildTextFormField("Gender", "male"),
                  _buildTextFormField("Email", "johndoe@example.com"),
                  _buildTextFormField("Mobile number", "1234567890"),
                  _buildTextFormField("Password", "securePassword"),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality to edit profile
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label, String initialValue) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
