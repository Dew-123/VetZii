import '../../../core/app_export.dart';

/// This class is used in the [petownercreateanaccount_item_widget] screen.
class PetownercreateanaccountItemModel {
  PetownercreateanaccountItemModel({this.id}) {
    id = id ?? Rx("");
  }

  Rx<String>? id;
}
