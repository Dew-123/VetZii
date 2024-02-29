import '../controller/forgot_password_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ForgotPasswordTwoScreen.
///
/// This class ensures that the ForgotPasswordTwoController is created when the
/// ForgotPasswordTwoScreen is first loaded.
class ForgotPasswordTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordTwoController());
  }
}
