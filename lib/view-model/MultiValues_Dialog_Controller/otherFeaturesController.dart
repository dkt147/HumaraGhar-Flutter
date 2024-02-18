
              // Other Features
import 'package:HumaraGhar/components/multiValueDialog/MainFeaturesDialog/mainFeaturesDialog.dart';
import 'package:HumaraGhar/components/multiValueDialog/OtherFeaturesDialog/otherDialog.dart';
import 'package:get/get.dart';

class MultipleOtherFeaturesController extends GetxController {
  final RxList selectedFeatures = <String>[].obs;

  Future<void> showMultiSelectOtherFacilities() async {
    final List<String> items = ['Facilites for disabled', 'Maintenance', 'Parking Area', 'Broadband Internet Access' , 'Cable TV ACCESS' , 'Electricity backup' , 'Community Centers'];

    final List<String>? results = await Get.dialog(
      OtherDialog(dialogTitle: 'Other Features',items: items)
      
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
