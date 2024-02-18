

import 'package:HumaraGhar/components/round_button.dart';
import 'package:HumaraGhar/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AdDescriptionContainer extends StatefulWidget {
  const AdDescriptionContainer({super.key});

  @override
  State<AdDescriptionContainer> createState() => _AdDescriptionContainerState();
}

class _AdDescriptionContainerState extends State<AdDescriptionContainer> {

  final ScrollController scrollController = ScrollController();
  final TextEditingController descriptionController  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
            onTap: (){
            showModalBottomSheet(
                backgroundColor: AppColors.BottomNavigationColor,
                isScrollControlled: true,
                context: context, builder: (_) => 
                  Container(
                    height: height * .9,
                    // color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(onPressed: (){
                                Navigator.pop(context);
                                }, icon: Icon(Icons.cancel),),
                              
                              SizedBox(width: width * .18,),
                              Center(child: Text('Add Description'  , style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 20),)),
                            ],
                          ),
                          
                          TextFormField(
                            minLines: 1,
                            maxLines: 10,
                            controller: descriptionController,
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              hintText: 'Add your project Description',
                              // hintMaxLines: null,
                              
                              
                            ),
                    
                          ),
                          SizedBox(height: 12,),
                          Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: (){
                                descriptionController.clear();
                              },
                              child: Text('Clear' , style: TextStyle(fontWeight: FontWeight.w600),),
                            ),
                            SizedBox( width: 18,)
                          ],),
                          SizedBox(height: 10,),
                          Center(
                            child: RoundButton(title: 'Done',
                            width: width * .4,
                             onTap: (){
                             Navigator.pop(context);
                               
                            }, loading: false),
                          )
                          
                          // Center(child: ElevatedButton(onPressed: (){
                          //  Navigator.pop(context);
                             
                          // },
                          // style: ElevatedButton.styleFrom(
                          //     backgroundColor: const Color.fromARGB(255, 33, 84, 125),
                          //     foregroundColor: const Color.fromARGB(255, 244, 244, 242)
                          //   ),
                          //  child: Text('Done')))
                        ],
                      ),
                    ),
                  )

              
              
              );
       
            },
            child:     Container(
                      height: height * .1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Project Description' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                            Icon(Icons.arrow_forward_ios , color: Colors.white,)
                            ],
                          ),
                          // Container(height: 20 , 
                          // width: width * 1,
                          // color:  Colors.red,),
                         Text(descriptionController.text.toString() , maxLines: 1,),
                         
                        ],
                      ),
                    ) ,
          );
  }
}
