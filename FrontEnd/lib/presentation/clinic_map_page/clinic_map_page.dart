import 'controller/clinic_map_controller.dart';
import 'dart:async';
import 'models/clinic_map_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mihan_s_application1/core/app_export.dart';

class ClinicMapPage extends StatelessWidget {
  ClinicMapPage({Key? key})
      : super(
          key: key,
        );

  Completer<GoogleMapController> googleMapController = Completer();

  ClinicMapController controller =
      Get.put(ClinicMapController(ClinicMapModel().obs));

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
              _buildMapSection(),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMapSection() {
    return SizedBox(
      height: 686.4.v,
      width: 360.3.h,
      child: GoogleMap(
        //TODO: Add your Google Maps API key in AndroidManifest.xml and pod file
        mapType: MapType.normal,
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
}

