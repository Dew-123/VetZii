import '../controller/book_appointment_controller.dart';
import 'package:get/get.dart';


class BookAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookAppointmentController());
  }
}
