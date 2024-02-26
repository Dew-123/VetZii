import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/start_page_screen/models/start_page_model.dart';

/// A controller class for the StartPageScreen.
///
/// This class manages the state of the StartPageScreen, including the
/// current startPageModelObj
class StartPageController extends GetxController {
  Rx<StartPageModel> startPageModelObj = StartPageModel().obs;
}
