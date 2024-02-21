import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/pet_owner_login_screen/models/pet_owner_login_model.dart';

/// A controller class for the PetOwnerLoginScreen.
///
/// This class manages the state of the PetOwnerLoginScreen, including the
/// current petOwnerLoginModelObj
class PetOwnerLoginController extends GetxController {
  Rx<PetOwnerLoginModel> petOwnerLoginModelObj = PetOwnerLoginModel().obs;
}
