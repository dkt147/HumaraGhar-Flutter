import 'package:HumaraGhar/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final IconData prefixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.onSubmitted,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal : width * .035),child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onSubmitted,
        
        validator: widget.validator,
        decoration: InputDecoration(
          labelText: widget.labelText,
          prefixIcon: Icon(widget.prefixIcon , color: AppColors.blueColor),
          labelStyle:  TextStyle(color : AppColors.blueColor),
            
             border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
        ),
        
  //       validator: (value) {
  //     if (value!.isEmpty) {
  //     return 'Please enter your email';
  //     }
  //     // if (!EmailValidator.validate(value)) {
  //     // return 'Please enter a valid email';
  //     // }
  //   return null;
  // },
      ),
    );
  }
}
