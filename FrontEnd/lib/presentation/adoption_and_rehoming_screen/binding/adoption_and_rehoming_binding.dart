import '../controller/adoption_and_rehoming_controller.dart';
import 'package:get/get.dart';

class AdoptionAndRehomingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdoptionAndRehomingController());
  }
}
