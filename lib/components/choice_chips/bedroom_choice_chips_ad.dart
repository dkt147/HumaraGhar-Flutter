
import 'package:HumaraGhar/components/choice_chips/choice_chip_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BedroomChoiceChipWidgetAdScreen extends StatefulWidget {
  final int numberOfChips;
  // final Function(int) onSelectedIndexChanged;

  BedroomChoiceChipWidgetAdScreen({
    required this.numberOfChips,
    // required this.onSelectedIndexChanged,
  });

  @override
  State<BedroomChoiceChipWidgetAdScreen> createState() => _BedroomChoiceChipWidgetAdScreenState();
}

class _BedroomChoiceChipWidgetAdScreenState extends State<BedroomChoiceChipWidgetAdScreen> {
  final selectedColor =  Color.fromARGB(255, 126, 213, 130);

  final backgroundColor =  Colors.blue.shade300;

  Color labelColor =  Colors.black;



  @override
  Widget build(BuildContext context) {
    final ChoiceChipController choiceChipController = Get.put(ChoiceChipController());
    return  
     
     GetBuilder<ChoiceChipController>(builder: (choiceChipController){
        return Wrap(
     spacing: 8.0,
     runSpacing: 2 ,
     children: List.generate(widget.numberOfChips, (index) {
       return  ConstrainedBox(
        constraints: BoxConstraints(maxHeight: double.infinity),
         child: ChoiceChip(
           label: Text('${index + 1}'),
           shape: 
           // StadiumBorder(side: BorderSide(  style: BorderStyle.solid, color: const Color.fromARGB(255, 11, 78, 13) , strokeAlign: BorderSide.strokeAlignOutside ,width: 1000.0 )),
           RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(900.0),
           ),
             labelStyle: TextStyle(color: labelColor),
              
             selectedColor: selectedColor,
             showCheckmark: false,
             backgroundColor: backgroundColor ,
             side: BorderSide.none,
           selected: choiceChipController.selectedBedroomChipIndexAdScreen == index,
           onSelected: (bool selected) {
            choiceChipController.updatedBedroomChipIndexAdScreen(selected , index);
             // setState(() {
             //   selectedChipIndex = selected ? index : -1;
             //   print(selectedChipIndex + 1);
             //   // widget.onSelectedIndexChanged(selectedChipIndex);
               
             // });
           },
         ),
       );
    
     }),
     );
       
     });
     
    
       }
}


