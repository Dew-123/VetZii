import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/clinic_map_page/models/clinic_map_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';


/// A controller class for the ClinicMapPage.
///
/// This class manages the state of the ClinicMapPage, including the
/// current clinicMapModelObj
class ClinicMapController extends GetxController {
  ClinicMapController(this.clinicMapModelObj);

  Rx<ClinicMapModel> clinicMapModelObj;
}
