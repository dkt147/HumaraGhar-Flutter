

import 'package:get/get.dart';

class ToggleButtonController extends GetxController{

  
  RxInt selectdValue = 0.obs;

  List<int> toggleValues = [0,1].obs;
  

void changeIndex(int value){
   selectdValue.value = value; 
  if (selectdValue == 0){
     selectdValue.value = toggleValues[0];
     print('Buy');
      }
  else{
    selectdValue.value = toggleValues[1];
    print('Rent');
  }
   
}


}