import 'package:HumaraGhar/API%20testing/Properties/getProperties/fetchPropertyListController.dart';
import 'package:HumaraGhar/API%20testing/Properties/getProperties/fetchPropertyListView.dart';
import 'package:HumaraGhar/API%20testing/Properties/getProperties/propertyListModel.dart';
import 'package:HumaraGhar/utils/Navigation_Drawer/navigation_drawer.dart';
import 'package:HumaraGhar/utils/background_container.dart';
import 'package:HumaraGhar/view-model/navbar_controller/navbar_controller.dart';
import 'package:HumaraGhar/view/main_screen/projects_view/new_project_details.dart';
import 'package:HumaraGhar/view/main_screen/projects_view/project_detail_API.dart';
import 'package:HumaraGhar/view/main_screen/projects_view/project_details.dart';
import 'package:HumaraGhar/view/main_screen/projects_view/project_list.dart';
import 'package:HumaraGhar/view/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

      // With Static Objects
 /* 
class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();

   
}

class _ProjectsViewState extends State<ProjectsView> {





  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return WillPopScope(
      onWillPop: ()async{
        return onPop();
      },
      child: BackgroundContainer(
        child: Scaffold(
          drawer: SideNavigationDrawer(),
          appBar: AppBar(
           systemOverlayStyle: SystemUiOverlayStyle(
             statusBarColor: Color.fromARGB(255, 172, 211, 206),
           ),
             title : Text('Projects')),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              Container(
                height: 40,
                width: double.infinity,
                color: const Color.fromARGB(255, 68, 0, 255),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text('Showing ${newProjectList.length} properties results.' ,style: GoogleFonts.robotoFlex(color: Colors.white),)],
                ),
              ),
    
              // With objects
    
              Expanded(
                child: ListView.builder(
                  itemCount: newProjectList.length,
                  itemBuilder: (context , index){
                    return  Padding(padding: EdgeInsets.only(top: height * .012 ),
                    child : ProjectPageContainer(
                  width: width * .95,
                  height: height * .2,
                  projectTitle: newProjectList[index].title,
                  projectLocation : newProjectList[index].location ,
                  projectDescription : newProjectList[index].description,
                  projectPrice : newProjectList[index].rentOrPrice,
                  imageUrl:   newProjectList[index].imageList ,
                  ownerInfo: newProjectList[index].ownerContactInfo
                ));
                }),
              ),

              
              SizedBox(height: 6,),
          
            ],
              
          ),
        ),
      ),
    );
    
  }
  
  ProjectPageContainer({width , height , color , projectTitle ,projectLocation , projectPrice , required List<String> imageUrl ,  ownerInfo , projectDescription}){
   return  Padding(
     padding: EdgeInsets.symmetric(horizontal : width *.025 ,),

                    // With objects

      child: InkWell(
      onTap: (){
        Get.to(ProjectDetails(
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

    onPop(){
    BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());
    if(bottomNavigationController.selectdIndex != 0 ){
    Get.to(NavigationPage());
    bottomNavigationController.changeIndex(0) ; 
      } else  {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');  
    }
  }
}

*/  



          // With Api


class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();

   
}

class _ProjectsViewState extends State<ProjectsView> {
  
  late Future<PropertyListModel> futurePropertyList;

  @override
  void initState() {
    super.initState();
    futurePropertyList = fetchPropertyList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return WillPopScope(
      onWillPop: ()async{
        return onPop();
      },
      child: BackgroundContainer(
        child: Scaffold(
          drawer: SideNavigationDrawer(),
          appBar: AppBar(
           systemOverlayStyle: SystemUiOverlayStyle(
             statusBarColor: Color.fromARGB(255, 172, 211, 206),
           ),
             title : Text('Projects')),
          body: FutureBuilder<PropertyListModel>(
            future: fetchPropertyList(), 
            builder: (context , snapshot){
             if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
            return Center(child: Text('No properties found'));
          } else {
            List<Property> propertyList = snapshot.data!.data;
             return 
             Column(
               children: [
                 Container(
                height: 40,
                width: double.infinity,
                color: const Color.fromARGB(255, 68, 0, 255),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text('Showing ${propertyList.length} properties results.' ,style: GoogleFonts.robotoFlex(color: Colors.white),),],
                ),
              ),
    
                
                 Expanded(
                   child: ListView.builder(
                    itemCount: propertyList.length,
                    itemBuilder: (context, index) {
                      Property property = propertyList[index];
                      return Padding(padding: EdgeInsets.only(top: height * .012 ), 
                      child : 
                       ProjectPageContainer(
                        property: property,
                        width: width * .95,
                        height: height * .2,
                        projectTitle: property.name,
                        projectLocation : property.propertyCategories[0].name ,
                        projectDescription : newProjectList[index].description,
                        projectPrice : property.price,
                        imageUrl:   property.propertyAttachments[0].url ,
                        ownerInfo: property.propertyDevelopers[0].name));
                      
                      // GestureDetector(
                      //   onTap: () {
                      //     // Navigator.push(
                      //       // context,
                      //       // MaterialPageRoute(builder: (context) => PropertyDetailsPage(property: property)),
                      //     // );
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.all(10),
                      //     margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       border: Border.all(color: Colors.grey),
                      //     ),
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         // Display first property image
                      //         Image.network(property.propertyAttachments[0].url),
                      //         SizedBox(height: 10),
                      //         // Display property title
                      //         Text(property.name, style: TextStyle(fontWeight: FontWeight.bold)),
                      //         SizedBox(height: 5),
                      //         // Display agency/builder name
                      //         Text(property.agencies[0].name),
                      //         SizedBox(height: 5),
                      //         // Display property price
                      //         Text('Price: ${property.price}'),
                      //       ],
                      //     ),
                      //   ),
                      // );
                   
                    }),
                 ),
               ],
             );
            }
            })
          
          //  Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          
          //     Container(
          //       height: 40,
          //       width: double.infinity,
          //       color: const Color.fromARGB(255, 68, 0, 255),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [Text('Showing ${newProjectList.length} properties results.' ,style: GoogleFonts.robotoFlex(color: Colors.white),)],
          //       ),
          //     ),
    
          //     // With objects
    
          //     Expanded(
          //       child: ListView.builder(
          //         itemCount: newProjectList.length,
          //         itemBuilder: (context , index){
          //           return  Padding(padding: EdgeInsets.only(top: height * .012 ),
          //           child : ProjectPageContainer(
          //         width: width * .95,
          //         height: height * .2,
          //         projectTitle: newProjectList[index].title,
          //         projectLocation : newProjectList[index].location ,
          //         projectDescription : newProjectList[index].description,
          //         projectPrice : newProjectList[index].rentOrPrice,
          //         imageUrl:   newProjectList[index].imageList ,
          //         ownerInfo: newProjectList[index].ownerContactInfo
          //       ));
          //       }),
          //     ),

              
          //     SizedBox(height: 6,),
          
          //   ],
              
          // ),
    
    
        ),
      ),
    );
    
  }
                // With object Container
  /* 
    ProjectPageContainer({width , height , color , projectTitle ,projectLocation , projectPrice , required List<String> imageUrl ,  ownerInfo , projectDescription}){
   return  Padding(
     padding: EdgeInsets.symmetric(horizontal : width *.025 ,),

                    // With objects

      child: InkWell(
      onTap: (){
        Get.to(ProjectDetails(
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
    */
       
       
              // With Api CONTAINER

              
  ProjectPageContainer({width , height , color , projectTitle ,projectLocation , projectPrice ,  imageUrl ,  ownerInfo , projectDescription ,required property}){
   return  Padding(
     padding: EdgeInsets.symmetric(horizontal : width *.025 ,),

                    // With objects

      child: InkWell(
      onTap: (){
        Get.to(ProjectDetails(
          property: property ,
          
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
                    image: NetworkImage(imageUrl),
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

    onPop(){
    BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());
    if(bottomNavigationController.selectdIndex != 0 ){
    Get.to(NavigationPage());
    bottomNavigationController.changeIndex(0) ; 
      } else  {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');  
    }
  }
}
