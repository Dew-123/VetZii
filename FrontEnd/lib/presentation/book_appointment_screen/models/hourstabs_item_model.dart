import 'package:get/get.dart';

class HourstabsItemModel {
  Rx<String>? tabVar;
  Rx<bool>? isSelected;

  // Constructor with named parameters
  HourstabsItemModel({
    String time = "09:00 AM", // Default time
    bool selected = false,    // Default selection status
  }) {
    tabVar = Rx(time);
    isSelected = Rx(selected);
  }
}
