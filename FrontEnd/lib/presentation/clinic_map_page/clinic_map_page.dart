import 'controller/clinic_map_controller.dart';
import 'dart:async';
import 'models/clinic_map_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

class ClinicMapPage extends StatelessWidget {
  ClinicMapPage({Key? key})
      : super(
          key: key,
        );

  Completer<GoogleMapController> googleMapController = Completer();

  ClinicMapController controller =
      Get.put(ClinicMapController(ClinicMapModel().obs));
  GoogleMapsPlaces places =
      GoogleMapsPlaces(apiKey: "@string/google_maps_api_key");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () {
            // Hide the keyboard when tapping outside the text field
            FocusScope.of(context).unfocus();
          },
          child: Container(
            width: SizeUtils.width,
            height: SizeUtils.height,
            child: Column(
              children: [_buildSearchBar(context),
                Expanded(
                  child: OverflowBox(
                    maxHeight: double.infinity,
                    child: _buildMapSection(context),
                  ),
                )],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMapSection(BuildContext context) {
    return SizedBox(
      height: 640.v,
      width: 360.3.h,
      child: GoogleMap(
        mapType: MapType.satellite,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            6.9271,
            79.8612,
          ),
          zoom: 11,
        ),
        onMapCreated: (GoogleMapController controller) {
          googleMapController.complete(controller);
        },
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Positioned(
      top: 16.0,
      left: 16.0,
      right: 16.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                Prediction? p = await PlacesAutocomplete.show(
                  context: context,
                  apiKey: "AIzaSyDq42xYGTjpIVOZ1b_7m7jbPX5Y_M7x83o",
                  mode: Mode.overlay,
                );

                if (p != null) {
                  PlacesDetailsResponse detail =
                      await places.getDetailsByPlaceId(p.placeId!);
                  double lat = detail.result.geometry!.location.lat;
                  double lng = detail.result.geometry!.location.lng;

                  GoogleMapController controller =
                      await googleMapController.future;
                  controller.animateCamera(
                    CameraUpdate.newLatLng(LatLng(lat, lng)),
                  );
                }
              },
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for clinics...",
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  // Handle search suggestions or filtering as needed
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
