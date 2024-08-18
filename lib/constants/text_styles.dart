

import 'package:HumaraGhar/constants/app_colors.dart';
import 'package:flutter/material.dart';


      // White Text Style
TextStyle primaryWhiteTextStyle({required double fontSize , required FontWeight fontWeight}){
  return TextStyle(
    fontFamily: 'Roboto',
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: AppColors.primaryWhiteColor
  );
}



          // Blue Text Style
TextStyle primaryBlueTextStyle({required double fontSize , required FontWeight fontWeight}){
  return TextStyle(
    fontFamily: 'Roboto',
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: AppColors.primaryBlueColor
  );
}


      // Roboto Flex White White Text Style
TextStyle robotoFlexWhiteTextStyle({required double fontSize , required FontWeight fontWeight}){
  return TextStyle(
    fontFamily: 'RobotoFlex',
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: AppColors.primaryWhiteColor
  );
}


      // Poppins White Text Style
TextStyle poppinsWhiteTextStyle({required double fontSize , required FontWeight fontWeight}){
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: AppColors.primaryWhiteColor
  );
}
