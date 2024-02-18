import 'package:HumaraGhar/utils/app_colors.dart';
import 'package:HumaraGhar/view-model/dropdown_controller/dropdown_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownButton extends StatelessWidget {
   DropDownButton({super.key});



  // String initialDropdownValue = 'Sq Ft.';

  List<String> areaUnit = ['Sq Ft.' , 'Marala', 'Acre'];
  
           
  @override
  Widget build(BuildContext context) {
    final DropDownListController dropDownListController = Get.put(DropDownListController());
    return  Obx( ()
      =>  Container(
        height : 40 ,
        width: 80,
        decoration: BoxDecoration(
          color: AppColors.BottomNavigationColor, 
        
          // borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 4.0 , left: 8 , ),
          child: DropdownButton(
            underline: Container(),
                  // focusColor: Colors.red,
              // iconEnabledColor: Colors.amber, 
                dropdownColor: AppColors.bottomSheetColor,
                      // Initial Value 
                      value: dropDownListController.selectedItem.value ,
                       
                        
                      // Down Arrow Icon 
                      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black,),     
                        
                      // Array list of items 
                      items: areaUnit.map((String items) { 
                        return DropdownMenuItem( 
                          value: items, 
                          child: Text(items), 
                        ); 
                      }).toList(), 
                      // After selecting the desired option,it will 
                      // change button value to selected value 
                      onChanged: (String? newValue) {  
                        dropDownListController.updateSelectedItem(newValue!);
                         
                      }),
        ),
      ),
    ); 
              
           
           
  }
}