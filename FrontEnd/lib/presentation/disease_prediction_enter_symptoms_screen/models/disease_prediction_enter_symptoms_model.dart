import '../../../core/app_export.dart';
import 'diseasepredictioncheckboxes_item_model.dart';

/// This class defines the variables used in the [disease_prediction_enter_symptoms_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DiseasePredictionEnterSymptomsModel {
  Rx<List<DiseasepredictioncheckboxesItemModel>>
      diseasepredictioncheckboxesItemList = Rx([
    DiseasepredictioncheckboxesItemModel(
        checkboxImage: ImageConstant.imgCheckmarkOnprimarycontainer.obs,
        textValue: "Changes in Appetite:".obs),
    DiseasepredictioncheckboxesItemModel(
        checkboxImage: ImageConstant.imgCheckmarkOnprimarycontainer.obs,
        textValue: "Vomiting".obs),
    DiseasepredictioncheckboxesItemModel(
        checkboxImage: ImageConstant.imgCheckmarkOnprimarycontainer.obs,
        textValue: "Diarrhea".obs),
    DiseasepredictioncheckboxesItemModel(
        checkboxImage: ImageConstant.imgCheckmarkOnprimarycontainer.obs,
        textValue: "Lethargy".obs),
    DiseasepredictioncheckboxesItemModel(
        checkboxImage: ImageConstant.imgCheckmarkOnprimarycontainer.obs,
        textValue: "Coughing or Sneezing".obs),
    DiseasepredictioncheckboxesItemModel(
        textValue: "Difficulty in Breathing".obs),
    DiseasepredictioncheckboxesItemModel(
        textValue: "Excessive Thirst or Urination".obs),
    DiseasepredictioncheckboxesItemModel(textValue: "Skin Issues".obs),
    DiseasepredictioncheckboxesItemModel(textValue: "Fever".obs),
    DiseasepredictioncheckboxesItemModel(textValue: "Excessive Scratching".obs)
  ]);
}
