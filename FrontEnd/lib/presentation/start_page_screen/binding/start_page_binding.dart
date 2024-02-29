import '../controller/start_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the StartPageScreen.
///
/// This class ensures that the StartPageController is created when the
/// StartPageScreen is first loaded.
class StartPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StartPageController());
  }
}
