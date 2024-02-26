import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/disease_prediction_start_screen/models/disease_prediction_start_model.dart';

/// A controller class for the DiseasePredictionStartScreen.
///
/// This class manages the state of the DiseasePredictionStartScreen, including the
/// current diseasePredictionStartModelObj
class DiseasePredictionStartController extends GetxController {
  Rx<DiseasePredictionStartModel> diseasePredictionStartModelObj =
      DiseasePredictionStartModel().obs;
}
