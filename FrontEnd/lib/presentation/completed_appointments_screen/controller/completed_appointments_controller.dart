import '../../../core/app_export.dart';
import '../models/completed_appointments_model.dart';

/// A controller class for the CompletedAppointmentsScreen.
///
/// This class manages the state of the CompletedAppointmentsScreen, including the
/// current completedAppointmentsModelObj
class CompletedAppointmentsController extends GetxController {
  Rx<CompletedAppointmentsModel> completedAppointmentsModelObj =
      CompletedAppointmentsModel().obs;
}
