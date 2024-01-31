import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/directory_vets_page/models/directory_vets_model.dart';

/// A controller class for the DirectoryVetsPage.
///
/// This class manages the state of the DirectoryVetsPage, including the
/// current directoryVetsModelObj
class DirectoryVetsController extends GetxController {
  DirectoryVetsController(this.directoryVetsModelObj);

  Rx<DirectoryVetsModel> directoryVetsModelObj;
}
