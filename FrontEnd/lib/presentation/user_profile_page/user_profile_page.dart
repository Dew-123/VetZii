
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/dataHandling/data.dart';
import 'package:http/http.dart' as http;
import 'package:mihan_s_application1/http_req/links.dart';
import 'package:mihan_s_application1/http_req/serverHandling.dart';

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
              _showLogooutConfirmationBox(context);

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
                        ServerHandling serverObject = new ServerHandling();
                        serverObject.saveChanges(
                            _editedFirstName,
                            _editedLastName ,
                            _editedPetName,
                            _editedPetType,
                            _editedGender,
                            _editedEmail,
                            _editedMobileNumber,
                            _editedPassword
                        );
                        setState(() {
                          _editMode = false;
                        });// Function to save changes to database
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
                      _showConfirmationBox(context);

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

  void _showConfirmationBox(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Confirmation', style: CustomTextStyles.headlineSmallBlack90002),
          content: Text('Please confirm to delete the account'),
          actions: [
            TextButton(onPressed: (){
              ServerHandling serverObject = new ServerHandling();
              serverObject.deleteUserAccount(UserData.email);
              print('Account Deleted!');
              Navigator.of(context).pop();
            },
                child: Text('Yes', style: TextStyle(color: Colors.black),),
            ),
            TextButton(onPressed: (){
              //close
              Navigator.of(context).pop();
            },
                child: Text('No', style: TextStyle(color: Colors.black),),
            ),
          ],
        );
      },
    );
  }

  void _showLogooutConfirmationBox(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Confirmation', style: CustomTextStyles.headlineSmallBlack90002),
          content: Text('Please confirm to log out.'),
          actions: [
            TextButton(onPressed: (){
              UserData.reset();
              Get.offAllNamed(AppRoutes.petOwnerLoginScreen);
              print('Logged Out!');
            },
              child: Text('Yes', style: TextStyle(color: Colors.black),),
            ),
            TextButton(onPressed: (){
              //close
              Navigator.of(context).pop();
            },
              child: Text('No', style: TextStyle(color: Colors.black),),
            ),
          ],
        );
      },
    );
  }

}
