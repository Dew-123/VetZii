import '../controller/forgot_password_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ForgotPasswordOneScreen.
///
/// This class ensures that the ForgotPasswordOneController is created when the
/// ForgotPasswordOneScreen is first loaded.
class ForgotPasswordOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordOneController());
  }
}
