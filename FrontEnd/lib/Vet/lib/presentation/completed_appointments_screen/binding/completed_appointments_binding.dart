import 'package:mihan_s_application1/Vet/lib/presentation/completed_appointments_screen/controller/completed_appointments_controller.dart';
import 'package:get/get.dart';

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