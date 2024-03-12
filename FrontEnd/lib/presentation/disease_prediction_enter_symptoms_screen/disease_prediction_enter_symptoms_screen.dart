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
              ElevatedButton(
                onPressed: (){},
                child: Text('Predict'),
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

