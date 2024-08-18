
import 'package:HumaraGhar/components/choice_chips/choice_chip_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BathroomChoiceChipWidgetFilterScreen extends StatefulWidget {
  final int numberOfChips;
  
  // final Function(int) onSelectedIndexChanged;

  BathroomChoiceChipWidgetFilterScreen({
    required this.numberOfChips,
    // required this.onSelectedIndexChanged,
  });

  @override
  State<BathroomChoiceChipWidgetFilterScreen> createState() => _BathroomChoiceChipWidgetFilterScreenState();
}

class _BathroomChoiceChipWidgetFilterScreenState extends State<BathroomChoiceChipWidgetFilterScreen> {
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
     runSpacing: 2,
     children: 
     
     List.generate(widget.numberOfChips, (index) {
       return  ConstrainedBox(
          constraints :   BoxConstraints(maxHeight: double.infinity),
         child: ChoiceChip(
            
           label: Text('${index + 1}'),
           shape: 
           RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(900.0),
           ),
            labelStyle: TextStyle(color: labelColor),
            selectedColor: selectedColor,
             showCheckmark: false,
             backgroundColor: backgroundColor ,
             side: BorderSide.none,
           selected: choiceChipController.selectedBathroomChipIndexFilterScreen == index,
           onSelected: (bool selected) {
            choiceChipController.updatedBathroomChipIndexFilterScreen(selected , index);
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


