
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
  final GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: "@string/google_maps_api_key");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,

        backgroundColor: Colors.transparent,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          child: Column(
            children: [
              _buildMapSection(context),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildMapSection(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () async {
              Prediction? p = await PlacesAutocomplete.show(
                context: context,
                apiKey: "@string/google_maps_api_key", // Replace with your actual API key
                mode: Mode.overlay, // Mode.overlay for full screen, Mode.overlayList for a list
              );

              if (p != null) {
                // Handle the selected place
                PlacesDetailsResponse detail =
                await places.getDetailsByPlaceId(p.placeId!);
                double lat = detail.result.geometry!.location.lat;
                double lng = detail.result.geometry!.location.lng;

                GoogleMapController controller = await googleMapController.future;
                controller.animateCamera(
                  CameraUpdate.newLatLng(LatLng(lat, lng)),
                );
              }
            },
            child: Text("Search Places"),
          ),
        ),
        SizedBox(
          height: 686.4.v,
          width: 360.3.h,
          child: GoogleMap(
            //TODO: Add your Google Maps API key in AndroidManifest.xml and pod file
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
        ),
      ],
    );
  }
}

