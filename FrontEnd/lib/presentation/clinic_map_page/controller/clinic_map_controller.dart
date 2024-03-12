import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/clinic_map_page/models/clinic_map_model.dart';


class ClinicMapController extends GetxController {
  ClinicMapController(this.clinicMapModelObj);

  Rx<ClinicMapModel> clinicMapModelObj;

}
