import 'hourstabs_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [book_appointment_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class BookAppointmentModel {
  Rx<List<HourstabsItemModel>> hourstabsItemList =
      Rx(List.generate(12, (index) => HourstabsItemModel()));
}
