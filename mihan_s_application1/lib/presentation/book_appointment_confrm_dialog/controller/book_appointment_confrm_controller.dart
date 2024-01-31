import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/book_appointment_confrm_dialog/models/book_appointment_confrm_model.dart';

/// A controller class for the BookAppointmentConfrmDialog.
///
/// This class manages the state of the BookAppointmentConfrmDialog, including the
/// current bookAppointmentConfrmModelObj
class BookAppointmentConfrmController extends GetxController {
  Rx<BookAppointmentConfrmModel> bookAppointmentConfrmModelObj =
      BookAppointmentConfrmModel().obs;
}
