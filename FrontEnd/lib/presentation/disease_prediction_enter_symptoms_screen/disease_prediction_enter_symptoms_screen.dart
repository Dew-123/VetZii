import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../../http_req/links.dart';

class DiseasePredictionPage extends StatefulWidget {
  @override
  _DiseasePredictionPageState createState() => _DiseasePredictionPageState();
}

class _DiseasePredictionPageState extends State<DiseasePredictionPage> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();


  String predictedDisease = '';
  double probability = 0.0;
  bool showResult = false;
  bool isLoading = false;

  Future<void> getPredictions() async {
    final age = int.tryParse(ageController.text) ?? 0;
    final temperature = double.tryParse(temperatureController.text) ?? 0.0;

    final animal = _animalspecies;
    final symptom1 = _symptom1;
    final symptom2 = _symptom2;
    final symptom3 = _symptom3;

    // Set loading state to true when making the request
    setState(() {
      isLoading = true;
    });

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
        Uri.parse(Links.predict),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(inputData),
      );

      print("running");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final prediction = data['predictedDisease'] as String;
        final probString = data['probability'] as String;
        final prob = double.tryParse(probString) ?? 0.0;
        setState(() {
          predictedDisease = prediction.isNotEmpty ? prediction : 'Unknown';
          probability = prob;
          showResult = true;
        });

      } else {
        throw Exception('Failed to get predictions');
      }
    } catch (error) {
      print(error);
    }
    finally {
      // Set loading state to false when request completes (whether success or failure)
      setState(() {
        isLoading = false;
      });
    }
  }

  String _symptom1 = "";
  String _symptom2 = "";
  String _symptom3 = "";
  String _animalspecies = "";


  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Center(
        child: CircularProgressIndicator(),
      ),
    )
        : Scaffold(
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
              //
              DropdownButtonFormField<String>(
                value: _animalspecies.isNotEmpty ? _animalspecies : null,
                onChanged: (String? newValue) {
                  setState(() {
                    _animalspecies = newValue ?? '';
                  });
                },
                items: <String>['cow','goat','buffalo'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value == '' ? 'Animal' : value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Animal', border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ), filled: true, fillColor: Colors.grey[50]),
                style: TextStyle(color: Colors.black),),

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
                  decoration: InputDecoration(labelText: 'Symptom 2', border: OutlineInputBorder(
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
                  decoration: InputDecoration(labelText: 'Symptom 3', border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ), filled: true, fillColor: Colors.grey[50]),
                  style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                    if (ageController.text.isEmpty ||
                        temperatureController.text.isEmpty ||
                        _animalspecies.isEmpty ||
                        _symptom1.isEmpty ||
                        _symptom2.isEmpty ||
                        _symptom3.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('Please fill out all fields.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    }
                    getPredictions();
                    },
                    child: Text('Predict the Disease',
                   style: TextStyle(color: Colors.black,
                      fontSize: 14),),
                ),
              ),

              SizedBox(height: 10,),

              if (showResult)
                Column(
                  children: [
                    Container(
                      width: 400,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Predicted Disease: ${predictedDisease.toUpperCase()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Probability: ${probability.toStringAsFixed(2)}%',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

