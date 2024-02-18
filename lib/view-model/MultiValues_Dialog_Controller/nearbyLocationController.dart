

        // Nearby Locations
import 'package:HumaraGhar/components/multiValueDialog/NearbyDialoge/nearbyDialog.dart';
import 'package:get/get.dart';

class MultipleNearbyLocationsController extends GetxController {
  final RxList selectedFeatures = <String>[].obs;

  Future<void> showMultiSelectNearbyLocations() async {
    final List<String> items = ['Mosque', 'Schools', 'Hospitals','Restaurant', 'Banks' , 'Public Transport Service' , 'Shopping Malls' , 'Other Nearby Places'];

    final List<String>? results = await Get.dialog(
      NearbyDialog(dialogTitle: 'Nearby Locations',items: items),
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
