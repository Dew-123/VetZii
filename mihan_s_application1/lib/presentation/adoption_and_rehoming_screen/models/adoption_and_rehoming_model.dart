import '../../../core/app_export.dart';
import 'userprofile1_item_model.dart';

/// This class defines the variables used in the [adoption_and_rehoming_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AdoptionAndRehomingModel {
  Rx<List<Userprofile1ItemModel>> userprofile1ItemList = Rx([
    Userprofile1ItemModel(
        userImage: ImageConstant.imgRectangle4235.obs,
        userName: "Bruno".obs,
        dogDetails: "German Shepherd \n5 months\nContact - 0715486235".obs),
    Userprofile1ItemModel(
        userImage: ImageConstant.imgRectangle4235148x109.obs,
        userName: "Whisker".obs,
        dogDetails: "Cat\n1 year\nContact - 0774567892".obs),
    Userprofile1ItemModel(
        userImage: ImageConstant.imgRectangle42351.obs,
        userName: "Abby".obs,
        dogDetails:
            "Beagle dog needs a home \n5 months\nContact - 0715486235".obs)
  ]);
}
