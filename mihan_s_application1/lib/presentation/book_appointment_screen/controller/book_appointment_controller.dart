import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/book_appointment_screen/models/book_appointment_model.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

/// A controller class for the BookAppointmentScreen.
///
/// This class manages the state of the BookAppointmentScreen, including the
/// current bookAppointmentModelObj
class BookAppointmentController extends GetxController {
  Rx<BookAppointmentModel> bookAppointmentModelObj = BookAppointmentModel().obs;

  Rx<List<DateTime?>> selectedDatesFromCalendar1 = Rx([]);
}
