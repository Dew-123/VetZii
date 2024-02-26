import '../controller/adoption_and_rehoming_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AdoptionAndRehomingScreen.
///
/// This class ensures that the AdoptionAndRehomingController is created when the
/// AdoptionAndRehomingScreen is first loaded.
class AdoptionAndRehomingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdoptionAndRehomingController());
  }
}