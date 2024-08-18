
import 'package:HumaraGhar/view-model/Ad_Controller/ad_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


  // Home Tabs
class HomeTabContainer extends StatelessWidget {
HomeTabContainer({Key? key}) : super(key: key);
  
  final selectedColor =  Color.fromARGB(255, 126, 213, 130);

  final backgroundColor =  Colors.blue.shade300;

  Color labelColor =  Colors.black;
   @override
  Widget build(BuildContext context) {
    
    AdController adController = Get.put(AdController());
    
    return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
              child: Wrap(
                spacing: 8,
                runSpacing: 12,
                children: List.generate(
                  adController.homeTabChoices.length,
                  (index) => Obx(
                    ()=> ChoiceChip(
                    showCheckmark: false,
                    selectedColor: selectedColor,
                    side: BorderSide.none,
                    labelStyle: TextStyle(color: labelColor),
                    backgroundColor: backgroundColor ,
                    shape: StadiumBorder(side: BorderSide(  style: BorderStyle.solid, color: const Color.fromARGB(255, 11, 78, 13) , strokeAlign: BorderSide.strokeAlignOutside ,width: 1000.0 )),
                
                      label: Text(adController.homeTabChoices[index]),
                      selected: adController.selectedHomeChoiceIndex == index,
                      onSelected: (bool selected) {
                        adController.handleHomeChipSelection(index);
                      },
                    ),
                  ),
                ),
              ),
            )
        );
     }
}

//  Plots Tab




class PlotTabContainer extends StatelessWidget {
PlotTabContainer({Key? key}) : super(key: key);
  
  final selectedColor =  Color.fromARGB(255, 126, 213, 130);

  final backgroundColor =  Colors.blue.shade300;

  Color labelColor =  Colors.black;
   @override
  Widget build(BuildContext context) {
    
    AdController adController = Get.put(AdController());
    
    return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
              child: Wrap(
                spacing: 8,
                runSpacing: 12,
                children: List.generate(
                  adController.plotTabChoices.length,
                  (index) => Obx(
                    ()=> ChoiceChip(
                    showCheckmark: false,
                    selectedColor: selectedColor,
                    side: BorderSide.none,
                    labelStyle: TextStyle(color: labelColor),
                    backgroundColor: backgroundColor ,
                    shape: StadiumBorder(side: BorderSide(  style: BorderStyle.solid, color: const Color.fromARGB(255, 11, 78, 13) , strokeAlign: BorderSide.strokeAlignOutside ,width: 1000.0 )),
                
                      label: Text(adController.plotTabChoices[index]),
                      selected: adController.selectedPlotChoiceIndex == index,
                      onSelected: (bool selected) {
                        adController.handlePlotChipSelection(index);
                      },
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

      // Commercial Tab Container  

class CommercialTabContainer extends StatelessWidget {
CommercialTabContainer({Key? key}) : super(key: key);
  
  final selectedColor =  Color.fromARGB(255, 126, 213, 130);

  final backgroundColor =  Colors.blue.shade300;

  Color labelColor =  Colors.black;
   @override
  Widget build(BuildContext context) {
    
    AdController adController = Get.put(AdController());
    
    return
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
              child: Wrap(
                spacing: 8,
                runSpacing: 12,
                children: List.generate(
                  adController.commercialTabChoices.length,
                  (index) => Obx(
                    ()=> ChoiceChip(
                    showCheckmark: false,
                    selectedColor: selectedColor,
                    side: BorderSide.none,
                    labelStyle: TextStyle(color: labelColor),
                    backgroundColor: backgroundColor ,
                    shape: StadiumBorder(side: BorderSide(  style: BorderStyle.solid, color: const Color.fromARGB(255, 11, 78, 13) , strokeAlign: BorderSide.strokeAlignOutside ,width: 1000.0 )),
                
                      label: Text(adController.commercialTabChoices[index]),
                      selected: adController.selectedCommercialChoiceIndex == index,
                      onSelected: (bool selected) {
                        adController.handleCommercialChipSelection(index);
                      },
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
