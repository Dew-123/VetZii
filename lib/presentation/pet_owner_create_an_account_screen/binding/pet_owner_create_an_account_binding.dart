import '../controller/pet_owner_create_an_account_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PetOwnerCreateAnAccountScreen.
///
/// This class ensures that the PetOwnerCreateAnAccountController is created when the
/// PetOwnerCreateAnAccountScreen is first loaded.
class PetOwnerCreateAnAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PetOwnerCreateAnAccountController>(() => PetOwnerCreateAnAccountController());
  }
}
