import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/app_navigation_screen/models/app_navigation_model.dart';


class AppNavigationController extends GetxController {
  Rx<AppNavigationModel> appNavigationModelObj = AppNavigationModel().obs;
}
