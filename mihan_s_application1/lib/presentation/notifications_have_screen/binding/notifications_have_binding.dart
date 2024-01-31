import '../controller/notifications_have_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NotificationsHaveScreen.
///
/// This class ensures that the NotificationsHaveController is created when the
/// NotificationsHaveScreen is first loaded.
class NotificationsHaveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationsHaveController());
  }
}
