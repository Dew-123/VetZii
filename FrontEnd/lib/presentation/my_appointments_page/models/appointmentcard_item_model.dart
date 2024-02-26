import '../../../core/app_export.dart';

/// This class is used in the [appointmentcard_item_widget] screen.
class AppointmentcardItemModel {
  AppointmentcardItemModel({
    this.time,
    this.doctorName,
    this.clinicName,
    this.id,
  }) {
    time = time ?? Rx("Jun 30, 2024 - 10.00 AM");
    doctorName = doctorName ?? Rx("Dr. Scott Adkins");
    clinicName =
        clinicName ?? Rx("CozyPaws Animal Clinic, \n56 Main Street, Cit");
    id = id ?? Rx("");
  }

  Rx<String>? time;

  Rx<String>? doctorName;

  Rx<String>? clinicName;

  Rx<String>? id;
}
