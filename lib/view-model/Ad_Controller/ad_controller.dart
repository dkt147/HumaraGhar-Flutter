
import 'package:get/get.dart';

class AdController extends GetxController{

      /* Purpose of sell */
  RxString choice = ''.obs;


  List<String> purposeOfAD = ['Sale', 'Rent Out'].obs;

  setPurpose(String newChoice){
    choice.value = newChoice;
    print(choice);
    

  }

       /* Home Tab Choices */
   RxList<String> homeTabChoices = [
    'House',
    'Flat',
    'Upper Portion',
    'Lower Portion',
    'Farm House',
    'Room',
    'PentHouse'
  ].obs;

  RxInt selectedHomeChoiceIndex = RxInt(-1);

  void handleHomeChipSelection(int index) {
    if (selectedHomeChoiceIndex.value == index) {
      selectedHomeChoiceIndex.value = -1;
    } else {
      selectedHomeChoiceIndex.value = index;
    }

    // You can use homeTabChoices[selectedChipIndex.value] as the selected value
    String selectedHomeTabValue = selectedHomeChoiceIndex.value != -1 ? homeTabChoices[selectedHomeChoiceIndex.value] : '';
    print('Selected Home Tab value: $selectedHomeTabValue');
  }



       /* Plot Tab Choices */
   RxList<String> plotTabChoices = [
    'Residential Plot',
    'Commercial Plot',
    'Agriculture Land',
    'Industrial Land',
    'Plot File',
    'Plot Form'
  ].obs;

  RxInt selectedPlotChoiceIndex = RxInt(-1);

    void handlePlotChipSelection(int index) {
    if (selectedPlotChoiceIndex.value == index) {
      selectedPlotChoiceIndex.value = -1;
    } else {
      selectedPlotChoiceIndex.value = index;
    }

    // You can use plotTabChoices[selectedChipIndex.value] as the selected value
    String selectedPlotTabValue = selectedPlotChoiceIndex.value != -1 ? plotTabChoices[selectedPlotChoiceIndex.value] : '';
    print('Selected Home Tab value: $selectedPlotTabValue');
  }
 




       /* Commercial Tab Choices */
   RxList<String> commercialTabChoices = [
    'Office',
    'Shop',
    'Wear House',
    'Factory',
    'Building',
    'Office'
  ].obs;

  RxInt selectedCommercialChoiceIndex = RxInt(-1);

  void handleCommercialChipSelection(int index) {
    if (selectedCommercialChoiceIndex.value == index) {
      selectedCommercialChoiceIndex.value = -1;
    } else {
      selectedCommercialChoiceIndex.value = index;
    }

    // You can use CommercialTabChoices[selectedChipIndex.value] as the selected value
    String selectedCommercialTabValue = selectedCommercialChoiceIndex.value != -1 ? commercialTabChoices[selectedCommercialChoiceIndex.value] : '';
    print('Selected Commercial Tab value: $selectedCommercialTabValue');
  }



}