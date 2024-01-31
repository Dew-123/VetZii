import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/notifications_have_screen/models/notifications_have_model.dart';

/// A controller class for the NotificationsHaveScreen.
///
/// This class manages the state of the NotificationsHaveScreen, including the
/// current notificationsHaveModelObj
class NotificationsHaveController extends GetxController {
  Rx<NotificationsHaveModel> notificationsHaveModelObj =
      NotificationsHaveModel().obs;
}
