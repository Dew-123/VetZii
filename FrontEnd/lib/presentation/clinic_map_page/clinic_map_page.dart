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
        backgroundColor: Colors.transparent,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
            child: _buildMapSection(),
          ),
        ),
    );
  }

  /// Section Widget
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
      ),
    );
  }
}

