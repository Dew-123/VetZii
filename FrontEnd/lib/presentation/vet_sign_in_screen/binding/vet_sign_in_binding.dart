import '../controller/vet_sign_in_controller.dart';
import 'package:get/get.dart';

/// A binding class for the UserSignInScreen.
///
/// This class ensures that the UserSignInController is created when the
/// UserSignInScreen is first loaded.
class VetSignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VetSignInController>(() => VetSignInController());
  }
}
