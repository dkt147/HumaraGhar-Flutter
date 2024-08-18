import 'package:HumaraGhar/API/GetSingleProperty/get_single_property_view.dart';
import 'package:HumaraGhar/API/latest_projects/model.dart';
import 'package:HumaraGhar/API/latest_projects/service.dart';
import 'package:HumaraGhar/API/property%20testing/Properties/getProperties/fetchPropertyListController.dart';
import 'package:HumaraGhar/API/property%20testing/Properties/getProperties/propertyListModel.dart';
import 'package:HumaraGhar/utils/Navigation_Drawer/navigation_drawer.dart';
import 'package:HumaraGhar/constants/background_container.dart';
import 'package:HumaraGhar/view-model/navbar_controller/navbar_controller.dart';
import 'package:HumaraGhar/view/main_screen/projects_view/project_detail_API.dart';
import 'package:HumaraGhar/view/main_screen/projects_view/project_list.dart';
import 'package:HumaraGhar/view/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


          // With Api


class LatestProjectsAllView extends StatefulWidget {
  const LatestProjectsAllView({super.key});

  @override
  State<LatestProjectsAllView> createState() => _LatestProjectsAllViewState();

   
}

class _LatestProjectsAllViewState extends State<LatestProjectsAllView> {
  
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
             title : Text('Latest Projects')),
          body: FutureBuilder<LatestProjectModel>(
                future: LatestProjectServices().fetchLatestProjects(),
                builder: (context , snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List<Project>? latestProject = snapshot.data!.response;
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
                  children: [Text('Showing ${latestProject!.length} properties results.' ,style: GoogleFonts.robotoFlex(color: Colors.white),),],
                ),
              ),
    
                
                 Expanded(
                   child: ListView.builder(
                    itemCount: latestProject.length,
                    itemBuilder: (context, index) {
                    var property =latestProject[index];
                 return Padding(padding: EdgeInsets.only(top: height * .012 ), 
                      child : 
                       ProjectPageContainer(
                        propertyID: property.propertyId,
                        property: property,
                        width: width * .95,
                        height: height * .2,
                        projectTitle: property.name,
                        projectLocation : 'Karachi' ,
                        projectDescription : property.userName,
                        projectPrice : property.price,
                        imageUrl:   property.attachmentUrl ,
                        ownerInfo: property.id));
                      
    
                    }),
                 ),
               ],
             );
            }else{
              return Center(child: Text('No latest project'));
            }
            })

    
    
        ),
      ),
    );
    
  }
       
              // With Api CONTAINER

              
  ProjectPageContainer({width , height , color , projectTitle ,projectLocation , projectPrice ,  imageUrl ,  ownerInfo , projectDescription ,required property , propertyID}){
   return  Padding(
     padding: EdgeInsets.symmetric(horizontal : width *.025 ,),

                    // With objects

      child: InkWell(
      onTap: (){
        Get.to(GetSinglePropertyView(propertyId: propertyID));
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
