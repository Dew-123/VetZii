import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/adoption_and_rehoming_screen/models/adoption_and_rehoming_model.dart';

class AdoptionAndRehomingController extends GetxController {
  Rx<AdoptionAndRehomingModel> adoptionAndRehomingModelObj =
      AdoptionAndRehomingModel().obs;
}
