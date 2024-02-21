import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/payment_page_screen/models/payment_page_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the PaymentPageScreen.
///
/// This class manages the state of the PaymentPageScreen, including the
/// current paymentPageModelObj
class PaymentPageController extends GetxController {
  TextEditingController nameFieldController = TextEditingController();

  TextEditingController cardNumberFieldController = TextEditingController();

  TextEditingController cvvFieldController = TextEditingController();

  Rx<PaymentPageModel> paymentPageModelObj = PaymentPageModel().obs;

  Rx<bool> isSelectedSwitch = false.obs;

  @override
  void onClose() {
    super.onClose();
    nameFieldController.dispose();
    cardNumberFieldController.dispose();
    cvvFieldController.dispose();
  }
}
