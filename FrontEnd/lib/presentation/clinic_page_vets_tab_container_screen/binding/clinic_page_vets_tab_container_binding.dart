import '../controller/clinic_page_vets_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ClinicPageVetsTabContainerScreen.
///
/// This class ensures that the ClinicPageVetsTabContainerController is created when the
/// ClinicPageVetsTabContainerScreen is first loaded.
class ClinicPageVetsTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClinicPageVetsTabContainerController());
  }
}
