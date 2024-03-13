import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:mihan_s_application1/presentation/disease_prediction_results_screen/disease_prediction_results_screen.dart';

import '../../Vet/lib/routes/app_routes.dart';

class DiseasePredictionPage extends StatefulWidget {
  @override
  _DiseasePredictionPageState createState() => _DiseasePredictionPageState();
}

class _DiseasePredictionPageState extends State<DiseasePredictionPage> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController animalController = TextEditingController();

  String predictedDisease = '';

  Future<void> getPredictions() async {
    final age = int.tryParse(ageController.text) ?? 0;
    final temperature = double.tryParse(temperatureController.text) ?? 0.0;
    final animal = animalController.text;
    final symptom1 = _symptom1;
    final symptom2 = _symptom2;
    final symptom3 = _symptom3;

    print("predicting");
    final inputData = {
      'Age': [age],
      'Temperature': [temperature],
      'Animal': [animal],
      'Symptom1': [symptom1],
      'Symptom2': [symptom2],
      'Symptom3': [symptom3],
    };

    print(inputData);

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/predict'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(inputData),
      );

      print("running");
      if (response.statusCode == 200) {
        final prediction = jsonDecode(response.body)['predictedDisease'] as String;
        setState(() {
          predictedDisease = prediction.isNotEmpty ? prediction : 'Unknown';
        });

        Get.to(DiseasePredictionResultsScreen(predictedDisease: predictedDisease));

      } else {
        throw Exception('Failed to get predictions');
      }
    } catch (error) {
      print(error);
    }
  }

  String _symptom1 = "";
  String _symptom2 = "";
  String _symptom3 = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disease Prediction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Age'),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: temperatureController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Temperature'),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: animalController,
                decoration: InputDecoration(labelText: 'Animal'),
              ),
              SizedBox(height: 20,),
              DropdownButtonFormField<String>(
                value: _symptom1.isNotEmpty ? _symptom1 : null,
                onChanged: (String? newValue) {
                  setState(() {
                    _symptom1 = newValue ?? '';
                  });
                },
                items: <String>['loss of appetite','depression','crackling sound','difficulty walking','painless lumps','shortness of breath','lameness','chills','swelling in extremities','fatigue','chest discomfort','swelling in limb','sweats','blisters on mouth','sores on mouth','swelling in abdomen','blisters on tongue','swelling in muscle','swelling in neck','sores on tongue','blisters on hooves','blisters on gums','sores on hooves','sores on gums'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value == '' ? 'Symptom 1' : value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Symptom 1', border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ), filled: true, fillColor: Colors.grey[50]),
              style: TextStyle(color: Colors.black),),
              SizedBox(height: 20,),


              DropdownButtonFormField<String>(
                value: _symptom2.isNotEmpty ? _symptom2 : null,
                onChanged: (String? newValue) {
                  setState(() {
                    _symptom2 = newValue ?? '';
                  });
                },
                items: <String>['loss of appetite','depression','crackling sound','difficulty walking','painless lumps','shortness of breath','lameness','chills','swelling in extremities','fatigue','chest discomfort','swelling in limb','sweats','blisters on mouth','sores on mouth','swelling in abdomen','blisters on tongue','swelling in muscle','swelling in neck','sores on tongue','blisters on hooves','blisters on gums','sores on hooves','sores on gums'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value == '' ? 'Symptom 2' : value),
                  );
                }).toList(),
                  decoration: InputDecoration(labelText: 'Symptom 1', border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ), filled: true, fillColor: Colors.grey[50]),
                  style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 20,),

              DropdownButtonFormField<String>(
                value: _symptom3.isNotEmpty ? _symptom3 : null,
                onChanged: (String? newValue) {
                  setState(() {
                    _symptom3 = newValue ?? '';
                  });
                },
                items: <String>['loss of appetite','depression','crackling sound','difficulty walking','painless lumps','shortness of breath','lameness','chills','swelling in extremities','fatigue','chest discomfort','swelling in limb','sweats','blisters on mouth','sores on mouth','swelling in abdomen','blisters on tongue','swelling in muscle','swelling in neck','sores on tongue','blisters on hooves','blisters on gums','sores on hooves','sores on gums'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value == '' ? 'Symptom 3' : value),
                  );
                }).toList(),
                  decoration: InputDecoration(labelText: 'Symptom 1', border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ), filled: true, fillColor: Colors.grey[50]),
                  style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    getPredictions();
                    Get.to(DiseasePredictionResultsScreen(predictedDisease: '',));
                    },
                    child: Text('Predict the Disease',
                   style: TextStyle(color: Colors.black,
                      fontSize: 14),),
                ),
              ),

              SizedBox(height: 16),
              Text('Predicted Disease: $predictedDisease'),
            ],
          ),
        ),
      ),
    );
  }
}

