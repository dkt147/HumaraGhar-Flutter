
          // Plot Features
import 'package:HumaraGhar/components/multiValueDialog/MainFeaturesDialog/mainFeaturesDialog.dart';
import 'package:HumaraGhar/components/multiValueDialog/PlotFeaturesDialog%20copy/plotDialog.dart';
import 'package:get/get.dart';

class MultiplePlotFeaturesController extends GetxController {
  final RxList selectedFeatures = <String>[].obs;

  Future<void> showMultiSelectPlotFeatures() async {
    final List<String> items = ['Gated Communities', 'Street Lighting', 'Legal Documentation', 'Sewer System' , 'Walking or Hiking Trails' , 'Trees and Landscaping'];

    final List<String>? results = await Get.dialog(
      PlotDialog(dialogTitle: 'Plot Features', items: items),
    );

    if (results != null) {
      selectedFeatures.assignAll(results);
    }
  }

  void itemChange(String itemValue, bool isSelected) {
    if (isSelected) {
      selectedFeatures.add(itemValue);
      print(itemValue);
    } else {
      selectedFeatures.remove(itemValue);
    }
  }

  void cancel() {
    Get.back(); // Close the dialog
  }

  void onSubmit() {
    Get.back(); // Close the dialog and return selectedFacilities
    selectedFeatures.forEach((element) {print(element);}); }
}