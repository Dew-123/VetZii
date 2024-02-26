import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/vet_acccount_page_about_page/models/vet_acccount_page_about_model.dart';

/// A controller class for the VetAcccountPageAboutPage.
///
/// This class manages the state of the VetAcccountPageAboutPage, including the
/// current vetAcccountPageAboutModelObj
class VetAcccountPageAboutController extends GetxController {
  VetAcccountPageAboutController(this.vetAcccountPageAboutModelObj);

  Rx<VetAcccountPageAboutModel> vetAcccountPageAboutModelObj;
}
