import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:mihan_s_application1/http_req/appointment.dart';

import '../../dataHandling/vetData.dart';

class VetTreatmentRecords extends StatefulWidget {
  const VetTreatmentRecords({Key? key}) : super(key: key);

  @override
  State<VetTreatmentRecords> createState() => _VetTreatmentRecordsState();
}

class _VetTreatmentRecordsState extends State<VetTreatmentRecords> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _ownerNameController = TextEditingController();
  TextEditingController _petNameController = TextEditingController();
  TextEditingController _petTypeController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  late String base64Image;
  DateTime selectedDate = DateTime.now();
  File? _image;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _dateController.text = selectedDate.toString().substring(0, 10);
      });
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);

        // Convert image to base64
        List<int> imageBytes = _image!.readAsBytesSync();
        base64Image = base64Encode(imageBytes);

        // Print the base64 string
        print('Base64 Image: $base64Image');
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vet Treatment Records'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextButton(
                onPressed: () => _selectDate(context),
                child: TextFormField(
                  controller: _dateController,
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the date';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16),
              _image != null
                  ? Image.file(
                _image!,
                height: 100,
                width: 100,
              )
                  : Container(),
              SizedBox(height: 16),
              TextButton(
                onPressed: _getImage,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  'Select Image',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _ownerNameController,
                decoration: InputDecoration(labelText: "Owner's Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter owner's name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _petNameController,
                decoration: InputDecoration(labelText: "Pet's Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter pet's name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _petTypeController,
                decoration: InputDecoration(labelText: 'Pet Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter pet type';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Appointment a = new Appointment();
                    await a.addPastTreatments(
                        VetData.email,
                      _dateController.text,
                      _ownerNameController.text,
                      _petNameController.text,
                      _petTypeController.text,
                      _descriptionController.text,
                      base64Image,
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
