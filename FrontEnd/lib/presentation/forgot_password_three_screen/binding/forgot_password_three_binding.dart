import '../controller/forgot_password_three_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ForgotPasswordThreeScreen.
///
/// This class ensures that the ForgotPasswordThreeController is created when the
/// ForgotPasswordThreeScreen is first loaded.
class ForgotPasswordThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordThreeController());
  }
}
