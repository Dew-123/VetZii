import 'petownercreateanaccount_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [pet_owner_create_an_account_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PetOwnerCreateAnAccountModel {
  Rx<List<PetownercreateanaccountItemModel>> petownercreateanaccountItemList =
      Rx(List.generate(2, (index) => PetownercreateanaccountItemModel()));
}
