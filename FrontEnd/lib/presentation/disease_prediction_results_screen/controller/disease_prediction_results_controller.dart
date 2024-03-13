import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/disease_prediction_results_screen/models/disease_prediction_results_model.dart';

class DiseasePredictionResultsController extends GetxController {
  Rx<DiseasePredictionResultsModel> diseasePredictionResultsModelObj =
      DiseasePredictionResultsModel().obs;
}
