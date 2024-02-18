// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:HumaraGhar/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BackgroundContainer extends StatelessWidget {
  Scaffold child;
   BackgroundContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
                  width: double.infinity,
                   decoration: BoxDecoration(
                     gradient: LinearGradient(
                      colors: [
                            AppColors.backgroundGradientColor1,
                            AppColors.backgroundGradientColor2,
                         ], 
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )
                  ),
      child: child);
  }
}
