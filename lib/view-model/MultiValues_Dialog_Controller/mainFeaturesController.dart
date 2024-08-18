
import 'package:HumaraGhar/components/multiValueDialog/MainFeaturesDialog/mainFeaturesDialog.dart';
import 'package:get/get.dart';


        
              // Main Features
class MultipleMainFeaturesController extends GetxController {
  final RxList selectedFeatures = <String>[].obs;


  Future<void> showMultiSelectMainFeatures() async {
    final List<String> items = ['24/7 Electricity', 'Water Supply', 'Gas Connection', 'Road Facing' , 'Gardens' , 'Waste Disposal'  ];

    final List<String>? results = await Get.dialog(
      MainFeaturesDialog(items: items , dialogTitle: 'Main Features',),
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

