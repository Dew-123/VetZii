import '../controller/pet_owner_login_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PetOwnerLoginScreen.
///
/// This class ensures that the PetOwnerLoginController is created when the
/// PetOwnerLoginScreen is first loaded.
class PetOwnerLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PetOwnerLoginController());
  }
}
