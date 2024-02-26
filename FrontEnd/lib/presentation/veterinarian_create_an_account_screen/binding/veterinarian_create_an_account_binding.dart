import '../controller/veterinarian_create_an_account_controller.dart';
import 'package:get/get.dart';

/// A binding class for the VeterinarianCreateAnAccountScreen.
///
/// This class ensures that the VeterinarianCreateAnAccountController is created when the
/// VeterinarianCreateAnAccountScreen is first loaded.
class VeterinarianCreateAnAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VeterinarianCreateAnAccountController());
  }
}
