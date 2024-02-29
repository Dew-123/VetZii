import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/notifications_no_screen/models/notifications_no_model.dart';

/// A controller class for the NotificationsNoScreen.
///
/// This class manages the state of the NotificationsNoScreen, including the
/// current notificationsNoModelObj
class NotificationsNoController extends GetxController {
  Rx<NotificationsNoModel> notificationsNoModelObj = NotificationsNoModel().obs;
}
