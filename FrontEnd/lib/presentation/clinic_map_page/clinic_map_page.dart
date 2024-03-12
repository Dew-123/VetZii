import 'package:mihan_s_application1/http_req/serverHandling.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mihan_s_application1/core/app_export.dart';

class ClinicMapPage extends StatefulWidget {
  ClinicMapPage({Key? key}) : super(key: key);

  @override
  _ClinicMapPageState createState() => _ClinicMapPageState();
}

class _ClinicMapPageState extends State<ClinicMapPage> {
  Completer<GoogleMapController> googleMapController = Completer();
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    _getClinicLocations();

  }
  @override
  Widget build(BuildContext context) {
   // return SafeArea(child: Text("asd"));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          child: _buildMapSection(),
        ),
      ),
    );
  }

  Widget _buildMapSection() {
    return SizedBox(
      height: 627.v,
      width: 349.h,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            37.43296265331129,
            -122.08832357078792,
          ),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          googleMapController.complete(controller);
        },
        zoomControlsEnabled: true,
        zoomGesturesEnabled: false,
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
        markers: Set<Marker>.of(markers),
      ),
    );
  }

  Future<void> _getClinicLocations() async {
    ServerHandling serverHandling = ServerHandling();
    List<dynamic> datas = await serverHandling.fetchVetsData();
    for (var data in datas) {
      // Check if "lat" and "long" keys exist in data
      if (data.containsKey("lat") && data.containsKey("long")) {
        double lat = data["lat"];
        double long = data["long"];
        String clinicName = data["clinic"] ?? "";
        print(lat);
        print(long);
        print(clinicName);
        _addMarker(LatLng(lat, long), clinicName);
      }
    }
  }


  void _addMarker(LatLng position, String clinicName) {
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId(clinicName),
          position: position,
          infoWindow: InfoWindow(
            title: clinicName,
          ),
        ),
      );
    });
  }
}
