
import 'package:flutter/material.dart';

import 'package:HumaraGhar/utils/app_colors.dart';

// ignore: must_be_immutable
class PasswordField extends StatefulWidget {
  final Function()? suffixIcon;
  final Function()? onTap;
  String? Function(String?)? validator;
  final String onEmptyField;
  final String confirmPasswordController;
  final String labelText;
   TextEditingController passwordController;

  PasswordField({
    Key? key,
    // , this.suffixIconVisible, this.suffixIconNotVisible,
    this.suffixIcon,
    this.onTap,
    required this.validator,
    required this.onEmptyField,
    required this.confirmPasswordController,
    required this.labelText,
    required this.passwordController,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width * 1;

    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .035),
      child: TextFormField(
        autofocus: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          widget.passwordController.text = value;
        },
        obscureText: _obsecureText,
        decoration: InputDecoration(
          enabled: true,
          hintText: 'Enter your password',
          hintStyle: TextStyle(color: AppColors.textHintColor),
          labelText: widget.labelText,
          labelStyle: TextStyle(color: AppColors.blueColor),
          prefixIcon: Icon(
            Icons.lock,
            color: AppColors.blueColor,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obsecureText = !_obsecureText;
              });
          
            },
          child: Icon(
              _obsecureText ? Icons.visibility : Icons.visibility_off,
              color: AppColors.blueColor,
            ),
          ),

          border: OutlineInputBorder(
            // borderSide:BorderSide(color: Colors.red),
            // borderSide: new BorderSide(
            //   // color: Colors.green,
            //   color: const Color.fromARGB(255, 20, 100, 23),
            //   width: 161,
            // ),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        validator: widget.validator,
        // validator: (value) {
        //   if(value!.isEmpty){
        //     return widget.onEmptyField;
        //   }

        // //   // else if(value.length < 6  ){
        // //   //   return 'Password should be minimum 6 characters';
        // //   // }
        // //   // else if(widget.confirmPasswordController != '' &&
        // //   //   value != widget.confirmPasswordController){
        // //   //   return 'password do not match';
        // //   // }
        //   else{
        //     return null;
        //   }
        // },
      ),
    );
  }
}
