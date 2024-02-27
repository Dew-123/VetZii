import 'dart:html';

import '../../../core/app_export.dart';

/// This class is used in the [mainmenugrid_item_widget] screen.
class MainmenugridItemModel {
  MainmenugridItemModel({
    this.image,
    this.text,
    this.id,
    this.onTap
  }) {
    image =
        image ?? Rx(ImageConstant.imgLinkedinOnprimarycontainer);
    text = text ?? Rx("Find a clinic");
    id = id ?? Rx("");
  }

  Rx<String>? image;

  Rx<String>? text;

  Rx<String>? id;

  Function? onTap;
}
