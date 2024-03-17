import 'dart:convert';

import 'package:mihan_s_application1/presentation/adoption_and_rehoming_screen/models/userprofile1_item_model.dart';
import '../../../core/app_export.dart';
import 'package:mihan_s_application1/http_req/petAdoptionServerHandling.dart';


class AdoptionAndRehomingModel {
  Rx<List<Userprofile1ItemModel>> userprofile1ItemList = Rx([]);
  late var databaseData;

  Future<void> fetchDataFromDatabase() async {
    databaseData = await fetchPetsData(); // Wait for the data to be fetched

    userprofile1ItemList.value = []; // Clear the list before adding new items

    for (var data in databaseData) {
      final decodedImage = base64Decode(data['image']);

      Userprofile1ItemModel userModel = Userprofile1ItemModel(
        userImage: decodedImage,
        userName: data['name'].toString(),
        contactInfo: data['contactNo'].toString(),
        dogDetails: data['description'].toString(),
      );
      userprofile1ItemList.value.add(userModel);
    }
  }
}
