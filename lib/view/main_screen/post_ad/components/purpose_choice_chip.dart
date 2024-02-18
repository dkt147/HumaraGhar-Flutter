
import 'package:HumaraGhar/view-model/Ad_Controller/ad_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PurposeChoiceChip extends StatelessWidget {
  PurposeChoiceChip({super.key});

  final selectedColor =  Color.fromARGB(255, 126, 213, 130);

  final backgroundColor =  Colors.blue.shade300;

  Color labelColor =  Colors.black;

  @override
  Widget build(BuildContext context) {
    
    AdController adController = Get.put(AdController());
    
    return  
       purposeChoiceChip(adController);         

  }

  Expanded purposeChoiceChip(AdController adController) {
        AdController adController = Get.put(AdController());
    return Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: adController.purposeOfAD.length,
          itemBuilder: (context , index){
            return     Obx(() => Padding(
              padding:const EdgeInsets.only( right : 12.0),
              child: ChoiceChip(label: Text(adController.purposeOfAD[index].toString()) ,
              
              showCheckmark: false,
              selectedColor: selectedColor,
               side: BorderSide.none,
                
              labelStyle: TextStyle(color: labelColor),
               backgroundColor: backgroundColor ,
               shape: StadiumBorder(side: BorderSide(  style: BorderStyle.solid, color: const Color.fromARGB(255, 11, 78, 13) , strokeAlign: BorderSide.strokeAlignOutside ,width: 1000.0 )),
                
            
              selected: (adController.choice == adController.purposeOfAD[index].toString()) ? true : false  ,
              onSelected: (bool value) {
                adController.setPurpose( adController.purposeOfAD[index].toString());
                
                
              },
               ),
            ));
        }),
      );
  }

}

