// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  // final double width;
  final VoidCallback onTap;
  final bool loading;
  final double? width ;
  final double? height ;
  const RoundButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.loading,
    this.height, this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    double defaultWidth = MediaQuery.of(context).size.width * 1;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration:  BoxDecoration(
          
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 92, 174, 201),
              Color.fromARGB(255, 71, 122, 117),
            ], 
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,

            
          ),
          borderRadius: BorderRadius.circular(24)
        ),
        width:  width ?? defaultWidth * .7,
        height: height ?? 50,
        // decoration: BoxDecoration(
          
        //   color: Colors.blue,
        //   borderRadius: BorderRadius.circular(24)
        // ),
        
        child: Center(child:loading ? CircularProgressIndicator(strokeWidth: 3, color: Colors.white,) : Text(title , style :  TextStyle(color: Colors.white , fontWeight: FontWeight.w600 , fontSize: 16 )))
      ),
    );
  }
}

