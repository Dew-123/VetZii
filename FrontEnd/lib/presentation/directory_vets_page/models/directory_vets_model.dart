import '../../../core/app_export.dart';
import 'userprofile_item_model.dart';
import 'package:mihan_s_application1/http_req/serverHandling.dart';

class DirectoryVetsModel {

  Rx<List<UserprofileItemModel>> userprofileItemList = Rx([]);


  Future<void> fetchDataFromDatabase() async {

    List<dynamic> databaseData = await fetchFromDatabase();

    userprofileItemList.value = [];

    for (var data in databaseData) {

      UserprofileItemModel userModel = (UserprofileItemModel(
        userImage: ImageConstant.imgImage81.obs,
        userImage1: ImageConstant.imgImage85.obs,
        userImage2: ImageConstant.imgImage86.obs,
        userText: data['fullName'].toString().obs,
        userText1: data['fieldOfExpertise'].toString().obs,
        data: data,
      ));
      userprofileItemList.value.add(userModel);
    }
  }


  Future<List<dynamic>> fetchFromDatabase() async {
    ServerHandling serverHandling = ServerHandling();

    try {
      List<dynamic> dataSet = await serverHandling.fetchVetsData();
      return dataSet;
    } catch (e) {
      print("Error fetching vets data: $e");

      return [];
    }
  }
}
