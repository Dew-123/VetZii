import 'package:dulanjana_s_application2/presentation/pending_appointments_container_screen/controller/pending_appointments_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PendingAppointmentsContainerScreen.
///
/// This class ensures that the PendingAppointmentsContainerController is created when the
/// PendingAppointmentsContainerScreen is first loaded.
class PendingAppointmentsContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PendingAppointmentsContainerController());
  }
}
