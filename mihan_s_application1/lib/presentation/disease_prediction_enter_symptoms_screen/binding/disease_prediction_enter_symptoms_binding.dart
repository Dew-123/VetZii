import '../controller/disease_prediction_enter_symptoms_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DiseasePredictionEnterSymptomsScreen.
///
/// This class ensures that the DiseasePredictionEnterSymptomsController is created when the
/// DiseasePredictionEnterSymptomsScreen is first loaded.
class DiseasePredictionEnterSymptomsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiseasePredictionEnterSymptomsController());
  }
}
