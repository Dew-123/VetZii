import 'package:mihan_s_application1/presentation/adoption_and_rehoming_screen/models/userprofile1_item_model.dart';
import '../../../core/app_export.dart';
import '../../../http_req/serverHandling.dart';
import 'package:mihan_s_application1/http_req/petAdoptionServerHandling.dart';

/// This class defines the variables used in the [adoption_and_rehoming_screen],
/// and is typically used to hold data that is passed between different parts of the application.
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

  // Method to fetch data from your database
  Future<List<dynamic>> fetchFromDatabase() async {
    try {
      List<dynamic> dataSet = await fetchPetsData();
      return dataSet;
    } catch (e) {
      print("Error fetching vets data: $e");

      return [];
    }
  }
}
