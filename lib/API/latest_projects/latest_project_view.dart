/** 

import 'package:HumaraGhar/API%20testing/latest_projects/model.dart';
import 'package:HumaraGhar/API%20testing/latest_projects/service.dart';
import 'package:flutter/material.dart';
import 'package:HumaraGhar/API%20testing/Banner/model.dart';
import 'package:HumaraGhar/API%20testing/Banner/service.dart';

class LatestProjectsView extends StatefulWidget {
  const LatestProjectsView({Key? key});

  @override
  State<LatestProjectsView> createState() => _LatestProjectsViewState();
}

class _LatestProjectsViewState extends State<LatestProjectsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FutureBuilder<LatestProjectModel>(
          future: LatestProjectServices().fetchLatestProjects(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List<Projects>? latestProject = snapshot.data!.projects;
              return ListView.builder(
                itemCount: latestProject!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(latestProject[index].name.toString()),
                    subtitle: Text(latestProject[index].price.toString()),
                  );
                },
              );
            } else {
              return Text('No Data');
            }
          },
        ),
      ),
    );
  }
}

*/

/////



import 'package:HumaraGhar/API/latest_projects/latesProjectDetailView.dart';
import 'package:HumaraGhar/API/latest_projects/latest_properties_all_view.dart';
import 'package:HumaraGhar/API/latest_projects/model.dart';
import 'package:HumaraGhar/API/latest_projects/service.dart';
import 'package:HumaraGhar/view-model/navbar_controller/navbar_controller.dart';
import 'package:HumaraGhar/view/main_screen/blogs/news.dart';
import 'package:HumaraGhar/view/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LatestProjectsView extends StatefulWidget {
  const LatestProjectsView({Key? key});

  @override
  State<LatestProjectsView> createState() => _LatestProjectsViewState();
}

class _LatestProjectsViewState extends State<LatestProjectsView> {
  @override
  Widget build(BuildContext context) {
        double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child:     projectsContainer(
                    width :  width * .96,
                     height : height * .28,
                     color : Colors.white,
                     containerHeading: 'Latest Project'
                    ),
        
          //  FutureBuilder<LatestProjectModel>(
            
          //   /**
             
          //      future: LatestProjectServices().fetchLatestProjects(),
          //                 builder: (context, snapshot) {
          //                   if (snapshot.connectionState == ConnectionState.waiting) {
          //                     return Center(child: CircularProgressIndicator());
          //                   } else if (snapshot.hasError) {
          //                     return Text("${snapshot.error}");
          //                   } else if (snapshot.hasData) {
          //                       return Text('Data loaded successfully');
        
          //    */
          //   future: LatestProjectServices().fetchLatestProjects(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(child: CircularProgressIndicator());
          //     } else if (snapshot.hasError) {
          //       return Text("${snapshot.error}");
          //     } else if (snapshot.hasData) {
          //       List<Project>? latestProject = snapshot.data!.response;
          //       return ListView.builder(
          //         itemCount: latestProject!.length,
          //         itemBuilder: (context, index) 
          //         {
          //           var property =latestProject[index];
          //           return InkWell(
          //             onTap: (){
          //               Get.to(latesProjectDetailView(projectDetails: latestProject[index]));
          //             },
          //             child: projects(height: height * 1 ,width: width * 1 , imageHeight: height * .55 ,
          //                imageWidth: width * .9 , imageUrl: property.attachmentUrl , description: property.name),
            
                      
          //           //    ListTile(
          //           //     leading: CircleAvatar(
          //           //       backgroundImage: NetworkImage(latestProject[index].attachmentUrl.toString()),),
          //           //     title: Text(property.name.toString()),
          //           //     subtitle: Text(property.propertyId.toString()),
          //           //   ),
          //           );
          //         },
          //       );
          //     } else {
          //       return Text('No Data');
          //     }
          //   },
          // ),
        
        ),
      ),
    );
  }
    projects({height , width , imageHeight , imageWidth , imageUrl ,  description , onTapNews}){
    return   InkWell(
      onTap: ()=> Get.to(NewsPage(newsDetails:  onTapNews  )),
      child: Padding(
        padding: const EdgeInsets.only(right :  8.0),
        child: Container(
             height: height * .8,
           width: width * .4,
            child: Column(
            children: [
            Container(
            height: imageHeight ,
            width:  imageWidth ,
            child: Image.network( imageUrl ,fit: BoxFit.cover,) ,),
            SizedBox(height: 6,),
            Text( description , overflow: TextOverflow.ellipsis,
             maxLines: 1,
             softWrap: true 
             ,style:  GoogleFonts.roboto(color: Colors.white , fontSize: 12) )
                      ],
           ),
         ),
      ),
    );
    
  }

         // Latest Projects Main Container
  projectsContainer({width , height , color , containerHeading}){
   return  ConstrainedBox(
    
    constraints: BoxConstraints(
      maxHeight: double.infinity
    ),
     child: Container(      
        width: width,
        // height: height,
       
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
           color: Colors.black45,
        ),
   
      child: Padding(
         padding: const EdgeInsets.symmetric( horizontal : 12.0 , vertical: 2), 
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(containerHeading , style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white)) ,
                TextButton(onPressed: (){
                  Get.to(LatestProjectsAllView());
                  // Get.to(NavigationPage());
                  
                  // bottomNavigationController.changeIndex(1);
   
                }, child: Text('View All' , style: TextStyle(color : Colors.blue , fontWeight: FontWeight.bold) ,)) 
              ],
            ),
   
            Container(
              
              height: height * .72,
              width: double.infinity,
              color: Color.fromARGB(0, 224, 18, 18),
              child: FutureBuilder<LatestProjectModel>(
                future: LatestProjectServices().fetchLatestProjects(),
                builder: (context , snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List<Project>? latestProject = snapshot.data!.response;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                
                itemCount: 5,
                itemBuilder: (context, index) 
                {
                  var property =latestProject![index];
                  return InkWell(
                    onTap: (){
                      Get.to(latesProjectDetailView(projectDetails: latestProject[index]));
                    },
                    child: projects(height: height * 1 ,width: width * 1 , imageHeight: height * .55 ,
                       imageWidth: width * .9 , imageUrl: property.attachmentUrl , description: property.name),
    
                    
           
                  );
                },
              );
            } else {
              return Text('No Data');
            }
                } ,)
                        
            )
            
          ],
        ),
      ),
      ),
   );
  }

}