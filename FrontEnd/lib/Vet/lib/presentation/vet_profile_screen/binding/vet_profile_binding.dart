import 'package:mihan_s_application1/Vet/lib/presentation/vet_profile_screen/controller/vet_profile_controller.dart';
import 'package:get/get.dart';

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