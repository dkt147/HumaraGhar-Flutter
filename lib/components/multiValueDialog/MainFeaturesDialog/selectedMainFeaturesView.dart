
import 'package:HumaraGhar/view-model/MultiValues_Dialog_Controller/mainFeaturesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectdMainFeaturesView extends StatelessWidget {
  final String title;

  final MultipleMainFeaturesController mainFeaturesController = Get.put(MultipleMainFeaturesController());

   SelectdMainFeaturesView({super.key, required this.title});

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
                onTap:() =>  mainFeaturesController.showMultiSelectMainFeatures(),
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
              children: mainFeaturesController.selectedFeatures.map(
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