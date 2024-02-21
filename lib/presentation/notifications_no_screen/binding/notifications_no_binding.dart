import '../controller/notifications_no_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NotificationsNoScreen.
///
/// This class ensures that the NotificationsNoController is created when the
/// NotificationsNoScreen is first loaded.
class NotificationsNoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationsNoController());
  }
}
