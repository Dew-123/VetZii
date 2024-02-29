import '../../../core/app_export.dart';
import 'paymentmethods_item_model.dart';

/// This class defines the variables used in the [payment_page_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PaymentPageModel {
  Rx<List<PaymentmethodsItemModel>> paymentmethodsItemList = Rx([
    PaymentmethodsItemModel(
        paypalImage: ImageConstant.imgGroup.obs, paypalText: "Paypal".obs),
    PaymentmethodsItemModel(
        paypalImage: ImageConstant.imgTelevision.obs,
        paypalText: "Credit Card".obs),
    PaymentmethodsItemModel(
        paypalImage: ImageConstant.imgThumbsUpBlueGray400.obs,
        paypalText: "Bank Transfer".obs)
  ]);
}
