
import 'package:HumaraGhar/view-model/MultiValues_Dialog_Controller/plotFeaturesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PlotDialogView extends StatelessWidget {
  final String title;

  final MultiplePlotFeaturesController plotFeaturesController = Get.put(MultiplePlotFeaturesController());


   PlotDialogView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap:() => plotFeaturesController.showMultiSelectPlotFeatures(),
                child: Container(
                  height: height * .07 ,
                  width: width  * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            
                  children: [
                    Text(title ,style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                            Icon(Icons.arrow_forward_ios , color: Colors.white,)
                    
                  ],
                ),),
              ),
            ],
          ),
          Obx(
            () => Wrap(
              children: plotFeaturesController.selectedFeatures.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(left : 2.0),
                  child: Chip(
                    label: Text(item),
                  ),
                ),
              ).toList(),
            ),
          )
        ],
      
    );
  }
}