
import 'package:get/get.dart';

class ChoiceChipController extends GetxController{
  

              // Post Ad Screen



  int selectedBathroomChipIndexAdScreen = -1;

  int selectedBedroomChipIndexAdScreen = -1;

  void updatedBathroomChipIndexAdScreen(selected , index){
    selectedBathroomChipIndexAdScreen = selected ? index : -1;
    print('Selected Bathroom Index at Ad Screen ${selectedBathroomChipIndexAdScreen + 1}');
    update();
  }
   

    void updatedBedroomChipIndexAdScreen(selected , index){
    selectedBedroomChipIndexAdScreen = selected ? index : -1;
    print('Selected Bathroom Index at Ad Screen ${ selectedBedroomChipIndexAdScreen + 1}' );
    update();
  }
   

                  // Filter Screen

  int selectedBathroomChipIndexFilterScreen = -1;

  int selectedBedroomChipIndexFilterScreen = -1;

  void updatedBathroomChipIndexFilterScreen(selected , index){
    selectedBathroomChipIndexFilterScreen = selected ? index : -1;
    print('Selected Bathroom Index at Filter Screen ${ selectedBathroomChipIndexFilterScreen + 1}');
    update();
  }
  

    void updatedBedroomChipIndexFilterScreen(selected , index){
    selectedBedroomChipIndexFilterScreen = selected ? index : -1;
    print('Selected Bedroom Index at Filter Screen ${selectedBedroomChipIndexFilterScreen + 1}' );
    update();
  }


}