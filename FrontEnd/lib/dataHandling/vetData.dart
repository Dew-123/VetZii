

class VetData {

  static String fullName = '';
  static String addressClinic = '';
  static String fieldOfExpertise = '';
  static String email = '';
  static String password = '';
  static String mobileNumber = '';
  static String clinicName = '';

  static String lat = '';
  static String long = '';


  // static Future<void> getLocation() async {
  //   Location location = Location();
  //
  //   // Request location permission (handle potential denial)
  //   bool serviceEnabled = await location.serviceEnabled();
  //   if (!serviceEnabled) {
  //     serviceEnabled = await location.requestService();
  //     if (!serviceEnabled) {
  //       return; // User denied permission or failed to enable location services
  //     }
  //   }
  //   PermissionStatus permissionStatus = await location.hasPermission();
  //   if (permissionStatus == PermissionStatus.denied) {
  //     permissionStatus = await location.requestPermission();
  //     if (permissionStatus != PermissionStatus.granted) {
  //       return; // User denied location permission
  //     }
  //   }
  //
  //   // Get current location
  //   LocationData locationData = await location.getLocation();
  //
  //   // Update VetData lat and long
  //   lat = locationData.latitude.toString();
  //   long = locationData.longitude.toString();
  // }

}
