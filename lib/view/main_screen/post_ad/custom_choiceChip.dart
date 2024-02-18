
import 'package:flutter/material.dart';

class BuildChoiceWidget extends StatefulWidget {
  
    final label;
    bool isSelected;
  
  BuildChoiceWidget({
    super.key,
    required this.label,
    required this.isSelected,
  });



  @override
  State<BuildChoiceWidget> createState() => _BuildChoiceWidgetState();
}

class _BuildChoiceWidgetState extends State<BuildChoiceWidget> {


   int selectedChipIndex = -1;
  final selectedColor =  Color.fromARGB(255, 126, 213, 130);
  final backgroundColor =  Colors.blue.shade300;
  Color labelColor =  Colors.black;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(widget.label , ), 
      labelStyle: TextStyle(color: labelColor),
      selected: widget.isSelected,
      selectedColor: selectedColor,
      showCheckmark: false,
      backgroundColor: backgroundColor ,
      side: BorderSide.none,
    
      // shape : ,

      shape: StadiumBorder(side: BorderSide(  style: BorderStyle.solid, color: const Color.fromARGB(255, 11, 78, 13) , strokeAlign: BorderSide.strokeAlignOutside ,width: 1000.0 )),
      

      onSelected: (value){
       setState(() {
        widget.isSelected = value;
        labelColor = widget.isSelected ?  const Color.fromARGB(255, 29, 100, 31) : Colors.black ;
         });
        
      },
      );


 
  }
}