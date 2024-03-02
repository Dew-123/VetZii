import '../../../core/app_export.dart';
import '../models/pending_appointments_container_model.dart';

/// A controller class for the PendingAppointmentsContainerScreen.
///
/// This class manages the state of the PendingAppointmentsContainerScreen, including the
/// current pendingAppointmentsContainerModelObj
class PendingAppointmentsContainerController extends GetxController {
  Rx<PendingAppointmentsContainerModel> pendingAppointmentsContainerModelObj =
      PendingAppointmentsContainerModel().obs;
}
