import 'package:flutter/cupertino.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/rehoming_form_screen/models/rehoming_form_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the RehomingFormScreen.
///
/// This class manages the state of the RehomingFormScreen, including the
/// current rehomingFormModelObj
class RehomingFormController extends GetxController {

  TextEditingController nameController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController enterDetailsController = TextEditingController();

  TextEditingController uploadImageController = TextEditingController();

  Rx<RehomingFormModel> rehomingFormModelObj = RehomingFormModel().obs;

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    descriptionController.dispose();
    enterDetailsController.dispose();
    uploadImageController.dispose();
  }
}
