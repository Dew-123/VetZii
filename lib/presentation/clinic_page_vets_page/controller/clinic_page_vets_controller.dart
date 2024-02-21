import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/clinic_page_vets_page/models/clinic_page_vets_model.dart';

/// A controller class for the ClinicPageVetsPage.
///
/// This class manages the state of the ClinicPageVetsPage, including the
/// current clinicPageVetsModelObj
class ClinicPageVetsController extends GetxController {
  ClinicPageVetsController(this.clinicPageVetsModelObj);

  Rx<ClinicPageVetsModel> clinicPageVetsModelObj;
}
