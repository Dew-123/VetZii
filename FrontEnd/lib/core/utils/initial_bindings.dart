import 'package:mihan_s_application1/core/app_export.dart';
import '/data/apiClient/api_client.dart';
class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
