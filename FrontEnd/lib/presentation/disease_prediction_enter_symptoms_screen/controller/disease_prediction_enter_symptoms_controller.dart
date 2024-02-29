import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/disease_prediction_enter_symptoms_screen/models/disease_prediction_enter_symptoms_model.dart';

/// A controller class for the DiseasePredictionEnterSymptomsScreen.
///
/// This class manages the state of the DiseasePredictionEnterSymptomsScreen, including the
/// current diseasePredictionEnterSymptomsModelObj
class DiseasePredictionEnterSymptomsController extends GetxController {
  Rx<DiseasePredictionEnterSymptomsModel>
      diseasePredictionEnterSymptomsModelObj =
      DiseasePredictionEnterSymptomsModel().obs;
}
