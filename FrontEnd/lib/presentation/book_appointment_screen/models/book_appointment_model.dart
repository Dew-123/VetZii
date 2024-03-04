import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'hourstabs_item_model.dart';

class BookAppointmentModel {
  Rx<List<HourstabsItemModel>> hourstabsItemList = Rx(
    List.generate(
      15, // From 9:00 AM to 6:00 PM with half-hour intervals -> 15 slots
          (index) {
        int hour = index ~/ 2 + 9; // Hour value
        int minute = index % 2 == 0 ? 0 : 30; // Minute value (0 or 30)
        String time = '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} ${hour < 12 ? 'AM' : 'PM'}';
        return HourstabsItemModel(time: time);
      },
    ),
  );
}
