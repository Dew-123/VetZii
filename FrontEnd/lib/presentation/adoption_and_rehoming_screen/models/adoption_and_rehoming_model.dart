import 'package:mihan_s_application1/presentation/adoption_and_rehoming_screen/models/userprofile1_item_model.dart';
import '../../../core/app_export.dart';
import 'package:mihan_s_application1/http_req/petAdoptionServerHandling.dart';

class AdoptionAndRehomingModel {

  Rx<List<Userprofile1ItemModel>> userprofile1ItemList = Rx([]);

  Future<void> fetchDataFromDatabase() async {

    List<dynamic> databaseData = await fetchFromDatabase();

    userprofile1ItemList.value = [];

    for (var data in databaseData) {

      Userprofile1ItemModel userModel = (Userprofile1ItemModel(
        userImage: ImageConstant.imgRectangle42351.obs,
        userName: data['name'].toString().obs,
        contactInfo: data['contactNo'].toString().obs,
        dogDetails: data['description'].toString().obs,
      ));
      userprofile1ItemList.value.add(userModel);
    }
  }

}
