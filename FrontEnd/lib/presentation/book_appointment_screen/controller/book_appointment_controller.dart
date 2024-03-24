import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/book_appointment_screen/models/book_appointment_model.dart';


class BookAppointmentController extends GetxController {
  Rx<BookAppointmentModel> bookAppointmentModelObj = BookAppointmentModel().obs;

  Rx<List<DateTime?>> selectedDatesFromCalendar1 = Rx([]);
}
