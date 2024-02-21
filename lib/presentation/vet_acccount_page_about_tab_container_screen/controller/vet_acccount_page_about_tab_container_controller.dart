import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/vet_acccount_page_about_tab_container_screen/models/vet_acccount_page_about_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the VetAcccountPageAboutTabContainerScreen.
///
/// This class manages the state of the VetAcccountPageAboutTabContainerScreen, including the
/// current vetAcccountPageAboutTabContainerModelObj
class VetAcccountPageAboutTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<VetAcccountPageAboutTabContainerModel>
      vetAcccountPageAboutTabContainerModelObj =
      VetAcccountPageAboutTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 3));
}
