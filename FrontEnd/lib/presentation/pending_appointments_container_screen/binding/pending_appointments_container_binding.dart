import 'package:get/get.dart';

import '../controller/pending_appointments_container_controller.dart';

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
