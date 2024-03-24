
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/dataHandling/vetData.dart';
import 'package:mihan_s_application1/http_req/serverHandling.dart';
import '../vet_location_picker_page/vet_location_picker_page.dart';
import 'vet_treatment_records.dart';

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
  late String _editedClinicName = VetData.clinicName ??'';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veterinarian Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context);
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
                  Container(
                    width: 280,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
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
                  ),


                  SizedBox(height: 10),
                  if (!_editMode)
                    Container(
                      width: 280,
                      child: ElevatedButton(
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
                    ),

                  if (_editMode)
                    Container(
                      width: 280,
                      child: ElevatedButton(
                        onPressed: () {
                          ServerHandling serverObject = new ServerHandling();
                          VetData.clinicName=_editedClinicName;
                          serverObject.saveChangesVet(
                              _editedFullName,
                              _editedAddressClinic,
                              _editedFieldOfExpertise,
                              _editedEmail,
                              _editedMobileNumber,
                              _editedPassword,
                              _editedClinicName,
                              );
                          setState(() {
                            _editMode = false;
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
                          'Confirm',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),

                  SizedBox(height: 10,),
                  Container(
                    width: 280,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(()=>VetTreatmentRecords());
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Add Treatment Records',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Container(
                    width: 280,
                    child: ElevatedButton(
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
                  )


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
      enabled: _editMode,
      obscureText: obscureText,
      onChanged: (value) {

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
              serverObject.deleteVetAccount(VetData.email);
              print('Account Deleted!');
              Get.offAllNamed(AppRoutes.vetSignIn);
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
