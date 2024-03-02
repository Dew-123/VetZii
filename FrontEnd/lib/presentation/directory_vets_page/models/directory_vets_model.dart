import '../../../core/app_export.dart';
import 'userprofile_item_model.dart';
import 'package:mihan_s_application1/http_req/serverHandling.dart';

class DirectoryVetsModel {

  Rx<List<UserprofileItemModel>> userprofileItemList = Rx([]);

  // Method to fetch data from the database and populate userprofileItemList
  Future<void> fetchDataFromDatabase() async {
    // Fetch data from server
    List<dynamic> databaseData = await fetchFromDatabase();
    // Clear existing data
    userprofileItemList.value = [];
    // Iterate over the fetched data and create UserprofileItemModel objects
    for (var data in databaseData) {
      // Assuming your database data contains fields like userImage, userText, userText1, etc.
      UserprofileItemModel userModel = (UserprofileItemModel(
        userImage: ImageConstant.imgImage81.obs, // Set your userImage here
        userImage1: ImageConstant.imgImage85.obs, // Set your userImage1 here
        userImage2: ImageConstant.imgImage86.obs, // Set your userImage2 here
        userText: data['fullName'].toString().obs, // Set your userText here
        userText1: data['fieldOfExpertise'].toString().obs,
        // onTap: () =>{
        //   print('adsd'),
        //   Get.toNamed(AppRoutes.vetAcccountPageAboutPage)// Set your userText1 here
        // }
      ));
      userprofileItemList.value.add(userModel);
    }
  }

  // Method to fetch data from your database
  Future<List<dynamic>> fetchFromDatabase() async {
    ServerHandling serverHandling = ServerHandling();

    try {
      List<dynamic> dataSet = await serverHandling.fetchVetsData();
      return dataSet;
    } catch (e) {
      print("Error fetching vets data: $e");
      // Handle error appropriately, like showing a message to the user
      return []; // Return empty list in case of error
    }
  }
}
