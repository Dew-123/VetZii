import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/adoption_and_rehoming_screen/models/adoption_and_rehoming_model.dart';

/// A controller class for the AdoptionAndRehomingScreen.
///
/// This class manages the state of the AdoptionAndRehomingScreen, including the
/// current adoptionAndRehomingModelObj
class AdoptionAndRehomingController extends GetxController {
  Rx<AdoptionAndRehomingModel> adoptionAndRehomingModelObj =
      AdoptionAndRehomingModel().obs;
}
