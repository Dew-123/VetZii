import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/vet_acccount_page_reviews_page/models/vet_acccount_page_reviews_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the VetAcccountPageReviewsPage.
///
/// This class manages the state of the VetAcccountPageReviewsPage, including the
/// current vetAcccountPageReviewsModelObj
class VetAcccountPageReviewsController extends GetxController {
  VetAcccountPageReviewsController(this.vetAcccountPageReviewsModelObj);

  TextEditingController reviewTwoController = TextEditingController();

  Rx<VetAcccountPageReviewsModel> vetAcccountPageReviewsModelObj;

  @override
  void onClose() {
    super.onClose();
    reviewTwoController.dispose();
  }
}
