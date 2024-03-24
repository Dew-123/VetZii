import '../controller/vet_login_controller.dart';
import 'package:get/get.dart';

class VetLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VetLoginController());
  }
}
