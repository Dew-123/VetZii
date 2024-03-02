import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:mihan_s_application1/presentation/book_appointment_confrm_dialog/controller/book_appointment_confrm_controller.dart';

/// A binding class for the BookAppointmentScreen.
///
/// This class ensures that the BookAppointmentController is created when the
/// BookAppointmentScreen is first loaded.
class BookAppointmentConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookAppointmentConfrmController());
  }
}
