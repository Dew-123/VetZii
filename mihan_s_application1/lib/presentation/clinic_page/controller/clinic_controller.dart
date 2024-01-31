import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/clinic_page/models/clinic_model.dart';

/// A controller class for the ClinicPage.
///
/// This class manages the state of the ClinicPage, including the
/// current clinicModelObj
class ClinicController extends GetxController {
  ClinicController(this.clinicModelObj);

  Rx<ClinicModel> clinicModelObj;
}
