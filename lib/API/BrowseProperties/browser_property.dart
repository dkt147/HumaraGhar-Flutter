
import 'package:HumaraGhar/API/BrowseProperties/service.dart';
import 'package:HumaraGhar/API/property%20testing/Properties/getProperties/propertyListModel.dart';
import 'package:HumaraGhar/view-model/navbar_controller/navbar_controller.dart';
import 'package:HumaraGhar/view/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BrowsePropertyView extends StatefulWidget {
  const BrowsePropertyView({Key? key});

  @override
  State<BrowsePropertyView> createState() => _BrowsePropertyViewState();
}

class _BrowsePropertyViewState extends State<BrowsePropertyView> with TickerProviderStateMixin{

         late TabController tabController =TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:         // browse property
                  propertiesContainer(
                  width :  width * .96,
                   height : height * .54,
                   color : Colors.white,
                   containerHeading: 'Browse Properties',
                   tabController: tabController
                  ),
                     
      )
   
    );
  }

                      // Browse Properties Section
 
  propertiesContainer({width , height , color , containerHeading , tabController , BuildContext? context}){
  BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());    
   return  Container(      
    width: width ,
      height: height * .55,
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
                Get.to(NavigationPage());
                bottomNavigationController.changeIndex(2);
              }, child: Text('Search' , style: TextStyle(color : Colors.blue , fontWeight: FontWeight.bold) ,)) 
            ],
          ),
          TabBar(       
             controller: tabController,
                  isScrollable: false,
                  indicatorColor: Colors.green,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: EdgeInsets.symmetric(horizontal: 2),
                  dividerColor: Colors.transparent,
                  tabs: [
                  Tab(child: Text('Homes' , style: GoogleFonts.roboto(color: Colors.white ,fontSize: 18),),),
                  Tab(child: Text('Plots' , style: GoogleFonts.roboto(color: Colors.white,fontSize: 18 ),),),
                  Tab(child: Text('Commercial' , style: GoogleFonts.roboto(color: Colors.white,fontSize: 18 ),),),
          ]),
          // SizedBox(height: 4,),
          Expanded(
            child: TabBarView(
                      controller: tabController,
              children: [
                  homeTabContainer(height: height  , width:  width),
                  plotTabContainer(height: height , width:  width),
                  commericialTabContainer(height: height , width:  width)
          
         
            ]))
            
            ]),
              ),
             
       
      );
    


  }
  

  Widget homeTabContainer({height , width}){
    BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());    
    return  Container(decoration: BoxDecoration(
                //  color: const Color.fromARGB(41, 33, 149, 243), 
                borderRadius: BorderRadius.circular(12),
              ),
              child : FutureBuilder(
               future : BrowsePropertyServices().browseProperty() , 
               builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else if (snapshot.hasData) {
       
          List<dynamic>? houseProject = snapshot.data!.data!.house;
               return GridView.builder( 
                       padding: EdgeInsets.only(top: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  
                  crossAxisSpacing: 4.0,  
                  childAspectRatio: (1/.5),
                  mainAxisSpacing: 4.0 
              ),
               itemCount: houseProject!.length,
               itemBuilder: (BuildContext ctx, index) {
                            return insideTabContainer(height: height *.02 , width: width , title: houseProject[index].name 
                            , onTap: (){
                                   Get.to(NavigationPage(),  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);}  
                            );
                          });
                  
          
               
                              } else {
               return Text('No Data');
                              }
                            },
                          ));}

  Widget plotTabContainer({height , width}){
    BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());    
    return  Container(decoration: BoxDecoration(
                //  color: const Color.fromARGB(41, 33, 149, 243), 
                borderRadius: BorderRadius.circular(12),
              ),
              child :FutureBuilder(
      future: BrowsePropertyServices().browseProperty() , 
               builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else if (snapshot.hasData) {
          List<dynamic>? plotProject = snapshot.data!.data!.plot;
                     return GridView.builder( 
                       padding: EdgeInsets.only(top: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  
                  crossAxisSpacing: 4.0,  
                  childAspectRatio: (1/.5),
                  mainAxisSpacing: 4.0 
              ),
               itemCount: plotProject!.length,
               itemBuilder: (BuildContext ctx, index) {
                            return insideTabContainer(height: height *.02 , width: width , title: plotProject[index].name 
                            , onTap: (){
                                   Get.to(NavigationPage(),  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);}  
                            );
                          });
                  
               
             
                              } else {
               return Text('No Data');
                              }
                            },
                          ));}
      
  

  Widget commericialTabContainer({height , width}){
      BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());    
    return  Container(decoration: BoxDecoration(
                //  color: const Color.fromARGB(41, 33, 149, 243), 
                borderRadius: BorderRadius.circular(12),
              ),
              child : FutureBuilder(
      future: BrowsePropertyServices().browseProperty() , 
               builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else if (snapshot.hasData) {
          
          List<dynamic>? commercialProject = snapshot.data!.data!.commercial;
                     return GridView.builder( 
                       padding: EdgeInsets.only(top: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  
                  crossAxisSpacing: 4.0,  
                  childAspectRatio: (1/.5),
                  mainAxisSpacing: 4.0 
              ),
               itemCount: commercialProject !.length,
               itemBuilder: (BuildContext ctx, index) {
                            return insideTabContainer(
                              height: height *.02 , width: width ,
                               title: commercialProject[index].name 
                            , onTap: (){
                                   Get.to(NavigationPage(),  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);}  
                            );
                          });
                  
               
                
               
                              } else {
               return Text('No Data');
                              }
                            },
                          ));}
  InkWell insideTabContainer( {height, width , title , VoidCallback? onTap} ) {
    return InkWell(
                    onTap: onTap,
                     child: Container(
                       height:height * .12,
                       width: width * .26,
                       child: Center(child: Text(title , textAlign: TextAlign.center ,style: GoogleFonts.roboto(fontSize: 14 , color: Colors.white , fontWeight: FontWeight.w400),)),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(159, 33, 149, 243),
                      //  color: const Color.fromARGB(255, 15, 116, 198),
                        borderRadius: BorderRadius.circular(5)
                      ),
                     ),
                   );
  }



}