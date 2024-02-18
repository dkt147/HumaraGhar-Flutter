import 'package:HumaraGhar/utils/background_container.dart';
import 'package:HumaraGhar/view/main_screen/profile_view/my_properties/my_properties.dart';

import 'package:HumaraGhar/view/main_screen/profile_view/my_properties/my_properties_list.dart';
import 'package:HumaraGhar/view/main_screen/projects_view/new_project_details.dart';
import 'package:HumaraGhar/view/main_screen/projects_view/project_details.dart';
import 'package:HumaraGhar/view/main_screen/projects_view/project_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPropertiesView extends StatefulWidget {
  const MyPropertiesView({super.key});

  @override
  State<MyPropertiesView> createState() => _MyPropertiesViewState();
}

class _MyPropertiesViewState extends State<MyPropertiesView> {
  @override
  Widget build(BuildContext context) {
            double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return BackgroundContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Properties'),
        ),
        body: Column(
          children: [


                Expanded(
                child: ListView.builder(
                  itemCount: myPropertyList.length,
                  itemBuilder: (context , index){
                     if(myPropertyList.length  == 0 ){
                        return onEmptyList();
                     }
                     else{
                  return  Padding(padding: EdgeInsets.only(top: height * .012 ),
                    child : myPropertyPageContainer(
                  width: width * .95,
                  height: height * .2,
                  projectTitle: myPropertyList[index].title,
                  projectLocation : myPropertyList[index].location ,
                  projectDescription : myPropertyList[index].description,
                  projectPrice : myPropertyList[index].rentOrPrice,
                  imageUrl:   myPropertyList[index].imageList ,
                  ownerInfo: myPropertyList[index].ownerContactInfo
                ));
                }}),
              ),
          
          ],
        ),
      ));
  }
  onEmptyList() {
    print('Empty LIST'); 
    // Center(child: Text('No Properties Added Yet' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize: 22)
    // ),);
   }
   myPropertyPageContainer({width , height , color , projectTitle ,projectLocation , projectPrice , required List<String> imageUrl ,  ownerInfo , projectDescription}){
   return  Padding(
     padding: EdgeInsets.symmetric(horizontal : width *.025 ,),

      // With objects

      child: InkWell(
      onTap: (){
        Get.to(ProjectDetailsWithObjects(
            newProjectDetails: NewProjectDetails(
              imageList: imageUrl, 
              title: projectTitle, 
              description: projectDescription , 
              rentOrPrice: projectPrice, 
              location: projectLocation, 
              ownerContactInfo: ownerInfo) ,
          
          ));
      },
       child: Container(      
        width: width,
        height: height,
         
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
             color: color ?? Colors.black45,
          ),
        
        child: Padding(
           padding: EdgeInsets.symmetric( horizontal : width * .01 , vertical: 4), 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    // image container height
                    Container(height: height * .94 , width:  width * .3,
                    
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageUrl.first),
                  fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(12)
                ),),
              SizedBox(width: 12,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Wrap(children:[Text(projectTitle , style: TextStyle( fontWeight: FontWeight.bold,fontSize: 18 ,color: Colors.white))] ) ,
                   Text(projectLocation , style: TextStyle( fontWeight: FontWeight.w500, fontSize: 14 ,color: Colors.white)) ,
                   SizedBox(height: height * .15,),
                   Text("PKR ${projectPrice}"  , style: TextStyle( fontWeight: FontWeight.bold, fontSize: 14 ,color: Colors.white)) ,
                    
                       Text(ownerInfo , style : TextStyle( fontWeight: FontWeight.w500, fontSize: 14 , color: const Color.fromARGB(255, 9, 21, 30))),
                    GestureDetector(
                      onTap: (){},
                      child: Text('View Project' , style : TextStyle( fontWeight: FontWeight.w500, fontSize: 14 , color: Colors.blue))), 
                        ],)
                    ],),
                  ],),
                ),),
             ),);
   

          }

}