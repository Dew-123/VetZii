import '../../../core/app_export.dart';

/// This class is used in the [mainmenugrid_item_widget] screen.
class MainmenugridItemModel {
  MainmenugridItemModel({
    this.image,
    this.string,
    this.id,
  }) {
    image =
        image ?? Rx(ImageConstant.imgLinkedinOnprimarycontainer);
    string = string ?? Rx("Find a clinic");
    id = id ?? Rx("");
  }

  Rx<String>? image;

  Rx<String>? string;

  Rx<String>? id;
}
