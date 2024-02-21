import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/vet_login_screen/models/vet_login_model.dart';

/// A controller class for the VetLoginScreen.
///
/// This class manages the state of the VetLoginScreen, including the
/// current vetLoginModelObj
class VetLoginController extends GetxController {
  Rx<VetLoginModel> vetLoginModelObj = VetLoginModel().obs;
}
