import '../../../core/app_export.dart';
import '../models/pending_appointments_model.dart';

/// A controller class for the PendingAppointmentsPage.
///
/// This class manages the state of the PendingAppointmentsPage, including the
/// current pendingAppointmentsModelObj
class PendingAppointmentsController extends GetxController {
  PendingAppointmentsController(this.pendingAppointmentsModelObj);

  Rx<PendingAppointmentsModel> pendingAppointmentsModelObj;
}
