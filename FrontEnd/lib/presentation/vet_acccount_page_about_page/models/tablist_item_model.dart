import '../../../core/app_export.dart';

/// This class is used in the [tablist_item_widget] screen.
class TablistItemModel {
  TablistItemModel({
    this.grid,
    this.count,
    this.text,
    this.id,
  }) {
    grid = grid ?? Rx(ImageConstant.imgGridPrimary);
    count = count ?? Rx("100+");
    text = text ?? Rx("patients");
    id = id ?? Rx("");
  }

  Rx<String>? grid;

  Rx<String>? count;

  Rx<String>? text;

  Rx<String>? id;
}
