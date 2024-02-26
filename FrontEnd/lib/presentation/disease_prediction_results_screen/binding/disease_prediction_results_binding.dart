import '../controller/disease_prediction_results_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DiseasePredictionResultsScreen.
///
/// This class ensures that the DiseasePredictionResultsController is created when the
/// DiseasePredictionResultsScreen is first loaded.
class DiseasePredictionResultsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiseasePredictionResultsController());
  }
}
