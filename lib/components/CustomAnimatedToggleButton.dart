import 'dart:math';
import 'package:HumaraGhar/view-model/toggleButtonController.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:google_fonts/google_fonts.dart';


class ToggleButton extends StatelessWidget {
  const ToggleButton({super.key});

  @override
  Widget build(BuildContext context) {

    late ToggleButtonController toggleButtonController = Get.put(ToggleButtonController());
  
    return Obx(() =>  AnimatedToggleSwitch<int>.size(
                      height: 40,
                      current: min(toggleButtonController.selectdValue.value, 1),
                      style: ToggleStyle(
                        backgroundColor: Color.fromARGB(204, 35, 118, 143),
                        indicatorColor: Colors.green,
                        borderColor: Color.fromARGB(0, 1, 1, 1),
                        borderRadius: BorderRadius.circular(80.0),
                        indicatorBorderRadius: BorderRadius.circular(80),
                      ),
                      values: const [0, 1],
                      // values: toggleButtonController.toggleValues,
                      iconOpacity: 1.0,
                      selectedIconScale: 1.0,
                      // loading: true,
                      // loadingAnimationDuration: Duration(milliseconds: 5),
                      indicatorSize: const Size.fromWidth(70),
                      iconAnimationType: AnimationType.onSelected,
                      styleAnimationType: AnimationType.onHover,
                      spacing: 0.0,
                      customIconBuilder: (context, local, global) {
                        final text = const ['Buy' , 'Rent'][local.index];
                        return Center(
                            child: Text(text,
                                style: GoogleFonts.robotoFlex(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Color.lerp(Color.fromARGB(255, 255, 255, 255), Colors.white , 
                                        local.animationValue))));
                      },
                      // onChanged: (i) => setState(() =>
                      //  value = i),
                      onChanged: (i){
                        toggleButtonController.changeIndex(i);
                      }
          
      
    )
 );
  }
}