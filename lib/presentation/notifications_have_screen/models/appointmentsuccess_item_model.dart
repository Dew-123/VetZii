import '../../../core/app_export.dart';

/// This class is used in the [appointmentsuccess_item_widget] screen.
class AppointmentsuccessItemModel {
  AppointmentsuccessItemModel({
    this.userImage,
    this.appointmentSuccessText,
    this.successMessageText,
    this.id,
  }) {
    userImage = userImage ?? Rx(ImageConstant.imgUser);
    appointmentSuccessText =
        appointmentSuccessText ?? Rx("Appointment Success");
    successMessageText = successMessageText ??
        Rx("You have successfully booked your appointment with Dr. Emily Walker.");
    id = id ?? Rx("");
  }

  Rx<String>? userImage;

  Rx<String>? appointmentSuccessText;

  Rx<String>? successMessageText;

  Rx<String>? id;
}
