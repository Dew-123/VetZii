import '../controller/vet_login_controller.dart';
import 'package:get/get.dart';

/// A binding class for the VetLoginScreen.
///
/// This class ensures that the VetLoginController is created when the
/// VetLoginScreen is first loaded.
class VetLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VetLoginController());
  }
}
