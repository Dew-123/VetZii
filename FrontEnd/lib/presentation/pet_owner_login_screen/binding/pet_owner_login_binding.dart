import '../controller/pet_owner_login_controller.dart';
import 'package:get/get.dart';

class PetOwnerLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PetOwnerLoginController());
  }
}
