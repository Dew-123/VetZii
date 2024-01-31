import '../../../core/app_export.dart';
import 'appointmentsuccess_item_model.dart';

/// This class defines the variables used in the [notifications_have_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class NotificationsHaveModel {
  Rx<List<AppointmentsuccessItemModel>> appointmentsuccessItemList = Rx([
    AppointmentsuccessItemModel(
        userImage: ImageConstant.imgUser.obs,
        appointmentSuccessText: "Appointment Success".obs,
        successMessageText:
            "You have successfully booked your appointment with Dr. Emily Walker."
                .obs),
    AppointmentsuccessItemModel(
        appointmentSuccessText: "Appointment Cancelled".obs,
        successMessageText:
            "You have successfully cancelled your appointment with Dr. David Patel."
                .obs),
    AppointmentsuccessItemModel(
        appointmentSuccessText: "Scheduled Changed".obs,
        successMessageText:
            "You have successfully changes your appointment with Dr. Jesica Turner."
                .obs)
  ]);
}
