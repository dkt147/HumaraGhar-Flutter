
import 'package:get/get.dart';

class DropDownListController extends GetxController{

  var selectedItem = "Sq Ft.".obs;
  
  // String initialDropdownValue = 'Sq Ft.';

  List<String> areaUnit = ['Sq Ft.' , 'Marala', 'Acre'];
  
  void updateSelectedItem(String newValue){
    selectedItem.value = newValue;

  }

}