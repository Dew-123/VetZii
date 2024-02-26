import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/presentation/vet_acccount_page_book_page/models/vet_acccount_page_book_model.dart';

/// A controller class for the VetAcccountPageBookPage.
///
/// This class manages the state of the VetAcccountPageBookPage, including the
/// current vetAcccountPageBookModelObj
class VetAcccountPageBookController extends GetxController {
  VetAcccountPageBookController(this.vetAcccountPageBookModelObj);

  Rx<VetAcccountPageBookModel> vetAcccountPageBookModelObj;
}
