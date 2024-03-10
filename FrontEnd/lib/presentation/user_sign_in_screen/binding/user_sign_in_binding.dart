import '../controller/user_sign_in_controller.dart';
import 'package:get/get.dart';

class UserSignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserSignInController>(() => UserSignInController());
  }
}
