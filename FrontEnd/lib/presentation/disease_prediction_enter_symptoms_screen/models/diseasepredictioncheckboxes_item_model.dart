import '../../../core/app_export.dart';

/// This class is used in the [diseasepredictioncheckboxes_item_widget] screen.
class DiseasepredictioncheckboxesItemModel {
  DiseasepredictioncheckboxesItemModel({
    this.checkboxImage,
    this.textValue,
    this.id,
  }) {
    checkboxImage =
        checkboxImage ?? Rx(ImageConstant.imgCheckmarkOnprimarycontainer);
    textValue = textValue ?? Rx("Changes in Appetite:");
    id = id ?? Rx("");
  }

  Rx<String>? checkboxImage;

  Rx<String>? textValue;

  Rx<String>? id;
}
