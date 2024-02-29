import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/clinic_page_vets_tab_container_screen/models/clinic_page_vets_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ClinicPageVetsTabContainerScreen.
///
/// This class manages the state of the ClinicPageVetsTabContainerScreen, including the
/// current clinicPageVetsTabContainerModelObj
class ClinicPageVetsTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<ClinicPageVetsTabContainerModel> clinicPageVetsTabContainerModelObj =
      ClinicPageVetsTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 2));
}
