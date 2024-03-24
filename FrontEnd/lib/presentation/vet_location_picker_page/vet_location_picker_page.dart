import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart' as loc;

import '../../dataHandling/vetData.dart';
import '../../http_req/links.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  late LatLng _pinPosition; // Position of the draggable pin


  static const LatLng _initialPosition = LatLng(37.422, -122.084);


  final loc.Location _location = loc.Location();

  @override
  void initState() {
    super.initState();
    _pinPosition = _initialPosition; // Initialize pin position with initial position
    _requestLocationPermission();
  }


  void _requestLocationPermission() async {
    final hasPermission = await _location.requestPermission();
    if (hasPermission == loc.PermissionStatus.granted) {

      _getCurrentLocation();
    } else {

      print('Location permission denied');
    }
  }


  void _getCurrentLocation() async {
    try {
      final locationData = await _location.getLocation();
      setState(() {
        _pinPosition = LatLng(locationData.latitude!, locationData.longitude!);
      });
    } catch (e) {

      print('Unable to get current location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 14.0, // Zoom level
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  zoomControlsEnabled: true,
                  zoomGesturesEnabled: true,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  markers: {
                    Marker(
                      markerId: MarkerId('pin'),
                      position: _pinPosition,
                      draggable: true,
                      onDragEnd: (LatLng newPosition) {
                        setState(() {
                          _pinPosition = newPosition;
                        });
                      },
                    ),
                  },
                ),

              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              print('Latitude: ${_pinPosition.latitude}, Longitude: ${_pinPosition.longitude}');
              VetData.long=_pinPosition.longitude;
              VetData.lat=_pinPosition.latitude;
              try {
                final response = await http.post(
                  Uri.parse(Links.updateVetData),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode({
                    'prevEmail': VetData.email,
                    'fullName': VetData.fullName,
                    'addressClinic': VetData.addressClinic,
                    'fieldOfExpertise': VetData.fieldOfExpertise,
                    'email': VetData.email,
                    'mobileNumber': VetData.mobileNumber,
                    'password': VetData.password,
                    'clinic': VetData.clinicName,
                    'lat': _pinPosition.latitude,
                    'long': _pinPosition.longitude,
                  }),
                );

                if (response.statusCode == 200) {
                  // Handle success
                  print('Vet profile updated successfully');
                  Navigator.pop(context); // Go back to the previous page
                } else {
                  // Handle error
                  print(response.body);
                  print('Failed to update vet profile');
                }
              } catch (error) {
                // Handle error
                print('Error updating vet profile: $error');
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lime, // Background color of the button
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25), // Button padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Button border radius
              ),
            ),
            child: Text(
              'Confirm',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 30)
        ],
      ),
    );
  }
}
