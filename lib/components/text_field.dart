// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final Icon prefixIcon;
  final Function()? suffixIcon;

  final Function()? onTap;
  final String onEmptyField;

  final TextInputType inputType;
  final TextEditingController textController;
  
  const InputTextField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
  
     this.onTap,
    required this.inputType,
    required this.onEmptyField, 
    required this.textController, 
    this.suffixIcon
  }) : super(key: key);

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 1;

      return  Padding(
        padding: EdgeInsets.symmetric(horizontal : width * .035),
        child: TextFormField(
          autofocus: false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: widget.inputType,
          decoration: InputDecoration(
            enabled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(color :  Colors.grey.shade400),
            labelText: widget.labelText,
            labelStyle:  TextStyle(color :  Colors.blue),
            prefixIcon: widget.prefixIcon,
          
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18)),
         ),
         onChanged: (value){
          setState(() {
            widget.textController.text = value;
          });
         },
          validator: (value) {
            if(value!.isEmpty){
              return widget.onEmptyField;
            }
            else{
              return null;
            }
          },
        ),
      );
            
  }
}
