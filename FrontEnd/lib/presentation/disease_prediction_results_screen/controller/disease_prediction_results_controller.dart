import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/disease_prediction_results_screen/models/disease_prediction_results_model.dart';

/// A controller class for the DiseasePredictionResultsScreen.
///
/// This class manages the state of the DiseasePredictionResultsScreen, including the
/// current diseasePredictionResultsModelObj
class DiseasePredictionResultsController extends GetxController {

  Rx<DiseasePredictionResultsModel> diseasePredictionResultsModelObj =
      DiseasePredictionResultsModel().obs;
}
