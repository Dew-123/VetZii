import '../../../core/app_export.dart';

/// This class is used in the [paymentmethods_item_widget] screen.
class PaymentmethodsItemModel {
  PaymentmethodsItemModel({
    this.paypalImage,
    this.paypalText,
    this.id,
  }) {
    paypalImage = paypalImage ?? Rx(ImageConstant.imgGroup);
    paypalText = paypalText ?? Rx("Paypal");
    id = id ?? Rx("");
  }

  Rx<String>? paypalImage;

  Rx<String>? paypalText;

  Rx<String>? id;
}
