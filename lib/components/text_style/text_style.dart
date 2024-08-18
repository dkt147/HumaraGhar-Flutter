
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingTextStyle extends StatelessWidget {
  final String text;
  final Color? color;
  const HeadingTextStyle({super.key, 
  required this.text,
  this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text( 
      text , style: GoogleFonts.robotoFlex(color: Colors.white) ,);
  }
}