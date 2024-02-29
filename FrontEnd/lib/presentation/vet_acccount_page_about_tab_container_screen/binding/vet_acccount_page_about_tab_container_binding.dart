import '../controller/vet_acccount_page_about_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the VetAcccountPageAboutTabContainerScreen.
///
/// This class ensures that the VetAcccountPageAboutTabContainerController is created when the
/// VetAcccountPageAboutTabContainerScreen is first loaded.
class VetAcccountPageAboutTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VetAcccountPageAboutTabContainerController());
  }
}
