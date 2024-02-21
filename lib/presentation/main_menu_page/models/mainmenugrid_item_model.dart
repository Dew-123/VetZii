import '../../../core/app_export.dart';

/// This class is used in the [mainmenugrid_item_widget] screen.
class MainmenugridItemModel {
  MainmenugridItemModel({
    this.findaclinic,
    this.findAClinic,
    this.id,
  }) {
    findaclinic =
        findaclinic ?? Rx(ImageConstant.imgLinkedinOnprimarycontainer);
    findAClinic = findAClinic ?? Rx("Find a clinic");
    id = id ?? Rx("");
  }

  Rx<String>? findaclinic;

  Rx<String>? findAClinic;

  Rx<String>? id;
}
