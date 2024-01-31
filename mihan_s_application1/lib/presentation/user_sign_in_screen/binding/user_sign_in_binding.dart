import '../controller/user_sign_in_controller.dart';
import 'package:get/get.dart';

/// A binding class for the UserSignInScreen.
///
/// This class ensures that the UserSignInController is created when the
/// UserSignInScreen is first loaded.
class UserSignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserSignInController());
  }
}
