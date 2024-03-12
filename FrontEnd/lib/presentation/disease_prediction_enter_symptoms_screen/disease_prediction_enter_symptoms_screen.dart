import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DiseasePredictionPage extends StatefulWidget {
  @override
  _DiseasePredictionPageState createState() => _DiseasePredictionPageState();
}

class _DiseasePredictionPageState extends State<DiseasePredictionPage> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController animalController = TextEditingController();
  final TextEditingController symptom1Controller = TextEditingController();
  final TextEditingController symptom2Controller = TextEditingController();
  final TextEditingController symptom3Controller = TextEditingController();
  String predictedDisease = '';

  Future<void> getPredictions() async {
    final age = int.tryParse(ageController.text) ?? 0;
    final temperature = double.tryParse(temperatureController.text) ?? 0.0;
    final animal = animalController.text;
    final symptom1 = symptom1Controller.text;
    final symptom2 = symptom2Controller.text;
    final symptom3 = symptom3Controller.text;

    print("predicting");
    final inputData = {
      'Age': [age],
      'Temperature': [temperature],
      'Animal': [animal],
      'Symptom1': [symptom1],
      'Symptom2': [symptom2],
      'Symptom3': [symptom3],
    };

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/predict'), // Replace with your backend URL
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
      } else {
        throw Exception('Failed to get predictions');
      }
    } catch (error) {
      print(error);
    }
  }

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
              TextField(
                controller: temperatureController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Temperature'),
              ),
              TextField(
                controller: animalController,
                decoration: InputDecoration(labelText: 'Animal'),
              ),
              TextField(
                controller: symptom1Controller,
                decoration: InputDecoration(labelText: 'Symptom 1'),
              ),
              TextField(
                controller: symptom2Controller,
                decoration: InputDecoration(labelText: 'Symptom 2'),
              ),
              TextField(
                controller: symptom3Controller,
                decoration: InputDecoration(labelText: 'Symptom 3'),
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: getPredictions,
                  child: Text('Predict the Disease', style: TextStyle(color: Colors.black,
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

