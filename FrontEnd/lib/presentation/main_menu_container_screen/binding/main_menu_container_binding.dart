import '../controller/main_menu_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MainMenuContainerScreen.
///
/// This class ensures that the MainMenuContainerController is created when the
/// MainMenuContainerScreen is first loaded.
class MainMenuContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainMenuContainerController>(() => MainMenuContainerController());
  }
}
