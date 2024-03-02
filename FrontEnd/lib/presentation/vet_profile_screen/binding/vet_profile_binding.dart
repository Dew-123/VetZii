import 'package:get/get.dart';
import '../controller/vet_profile_controller.dart';

/// A binding class for the VetProfileScreen.
///
/// This class ensures that the VetProfileController is created when the
/// VetProfileScreen is first loaded.
class VetProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VetProfileController());
  }
}
