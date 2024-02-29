import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/clinic_map_page/models/clinic_map_model.dart';

/// A controller class for the ClinicMapPage.
///
/// This class manages the state of the ClinicMapPage, including the
/// current clinicMapModelObj
class ClinicMapController extends GetxController {
  ClinicMapController(this.clinicMapModelObj);

  Rx<ClinicMapModel> clinicMapModelObj;
}
