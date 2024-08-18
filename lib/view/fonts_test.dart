
import 'package:flutter/material.dart';

class FontsTest extends StatefulWidget {
  const FontsTest({super.key});

  @override
  State<FontsTest> createState() => _FontsTestState();
}

class _FontsTestState extends State<FontsTest> {


  @override
  Widget build(BuildContext context) {
    return Container(
      
      
        decoration: const BoxDecoration(
             
          gradient: LinearGradient(
            colors: [
                Color.fromARGB(255, 115, 175, 170),
              Color.fromARGB(255, 208, 243, 255),
              Color.fromARGB(255, 115, 175, 170),
            ], 
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          
          )

        ) ,
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is font roboto light' , style: TextStyle(fontFamily: 'Roboto', fontSize: 30),),
            Text('This is font roboto light' , style: TextStyle(fontFamily: 'Roboto' ,fontWeight : FontWeight.w100 , fontSize: 30),),
            Text('This is font roboto regular' , style: TextStyle(fontFamily: 'Roboto',fontWeight : FontWeight.w400 , fontSize: 30),),
            Text('This is font roboto bold' , style: TextStyle(fontFamily: 'Roboto',fontWeight : FontWeight.bold , fontSize: 30),),

          ],
        ) ,));
    
  }
}