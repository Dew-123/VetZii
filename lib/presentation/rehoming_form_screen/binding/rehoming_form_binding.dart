import '../controller/rehoming_form_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RehomingFormScreen.
///
/// This class ensures that the RehomingFormController is created when the
/// RehomingFormScreen is first loaded.
class RehomingFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RehomingFormController());
  }
}
