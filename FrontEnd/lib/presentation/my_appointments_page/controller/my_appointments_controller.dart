import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/my_appointments_page/models/my_appointments_model.dart';

class MyAppointmentsController extends GetxController {
  MyAppointmentsController(this.myAppointmentsModelObj);

  Rx<MyAppointmentsModel> myAppointmentsModelObj;
}
