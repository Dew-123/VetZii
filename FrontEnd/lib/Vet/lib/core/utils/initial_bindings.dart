import 'package:mihan_s_application1/Vet/lib/core/network/network_info.dart';
import 'package:mihan_s_application1/Vet/lib/core/utils/pref_utils.dart';
import 'package:mihan_s_application1/vet/lib/core/app_export_vet.dart';
import 'package:mihan_s_application1/vet/lib/data/apiClient/api_client.dart';
class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(PrefUtils());
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    //Get.put(NetworkInfo(connectivity));
  }
}
