
import 'package:get/get.dart';

class DropDownListController extends GetxController{

  var selectedItem = "Sq. Ft".obs;
  
  // String initialDropdownValue = 'Sq Ft.';

  List<String> areaUnit = ['Sq. Ft' , 'Sq. Yd', 'Marala', 'Acre'];
  
  void updateSelectedItem(String newValue){
    selectedItem.value = newValue;

  }


  
  var selectedAreaSize = '80'.obs;

   void updateSelectedAreaSize(String newValue){
    selectedAreaSize.value = newValue;

  }



}