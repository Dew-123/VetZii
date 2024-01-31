import '../controller/disease_prediction_start_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DiseasePredictionStartScreen.
///
/// This class ensures that the DiseasePredictionStartController is created when the
/// DiseasePredictionStartScreen is first loaded.
class DiseasePredictionStartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiseasePredictionStartController());
  }
}
