import 'package:get/get.dart';
import '../controller/completed_appointments_controller.dart';

/// A binding class for the CompletedAppointmentsScreen.
///
/// This class ensures that the CompletedAppointmentsController is created when the
/// CompletedAppointmentsScreen is first loaded.
class CompletedAppointmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompletedAppointmentsController());
  }
}
