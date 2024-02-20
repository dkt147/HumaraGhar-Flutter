// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:HumaraGhar/API%20testing/Favorites/getFavoriteProperties/get_fav_handeler.dart';
import 'package:HumaraGhar/API%20testing/Favorites/getFavoriteProperties/get_favorite_model.dart';
import 'package:HumaraGhar/API%20testing/local%20db%20testing/user_service.dart';
import 'package:HumaraGhar/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:HumaraGhar/utils/Navigation_Drawer/navigation_drawer.dart';
import 'package:HumaraGhar/utils/background_container.dart';
import 'package:HumaraGhar/view-model/navbar_controller/navbar_controller.dart';
import 'package:HumaraGhar/view/main_screen/favorites_view/favorite_list.dart';
import 'package:HumaraGhar/view/main_screen/favorites_view/myFavoritesList.dart';
import 'package:HumaraGhar/view/main_screen/projects_view/new_project_details.dart';
import 'package:HumaraGhar/view/main_screen/projects_view/project_details.dart';
import 'package:HumaraGhar/view/navbar/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesView extends StatefulWidget {

   final NewProjectDetails? newProjectDetails;
  
  const FavoritesView({
    Key? key,
    this.newProjectDetails,
  }) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> with TickerProviderStateMixin {
 
 
 late Future<List<GetFavoriteProperty>> _futureProperties;
//  List favoriteList = [];

  fetchUserId()async{
    UserService userService = UserService();
    UserModel? user =  await userService.getUserDataFromPrefs();
    return user!.userID;
  }

   @override
   initState() {
    super.initState();
    _futureProperties = fetchFavoriteProperties('5'); // Pass the user ID here
  }

  @override
  Widget build(BuildContext context) {
   TabController tabController =TabController(length: 2, vsync: this);
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return WillPopScope(
      onWillPop: () async {
        return onPop();
      },
      child: BackgroundContainer(
        child: Scaffold(
          drawer: SideNavigationDrawer(),
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle( statusBarColor: Color.fromARGB(255, 172, 211, 206),),
            // title : Text('Favorites'),
          ),
           body: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            //  crossAxisAlignment: CrossAxisAlignment.center,
             children: [
      
                  TabBar(
                    
                    controller: tabController,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: EdgeInsets.symmetric(horizontal: 18),
                    dividerColor: Colors.transparent,
                    tabs: [
                    Tab(child: Text('Favorites' , style: GoogleFonts.roboto(color: Colors.white ,fontSize: 18),),),
                    Tab(child: Text('Saved Properties' , style: GoogleFonts.roboto(color: Colors.white,fontSize: 18 ),),)
                  ] ),
            
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [ 

                        /// For Saved Favorites Tab
                    FutureBuilder<List<GetFavoriteProperty>>(
        future: _futureProperties,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'No Favorite Properties yet',
              style: GoogleFonts.robotoFlex(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w500),
            ),
            Icon(Icons.favorite, size: 48, color: Colors.red),
          ],
        ),
      );
    }    else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final favorite = snapshot.data![index];
                return favoritesPageContainer(
                        property: 'asd',
                        width: width * .95,
                        height: height * .2,
                        projectTitle: favorite.propertyName,
                        projectLocation : 'khi' ,
                        projectDescription : 'daaaaa',
                        projectPrice : '20000000',
                        imageUrl:  'sadasdsa',
                        ownerInfo:favorite.userName);
                // ListTile(
                //   title: Text(snapshot.data![index]. propertyName),
                //   // subtitle: Text(snapshot.data![index].userName),
                //   subtitle: Text(snapshot.data![index].createdAt),
                // );
              },
            );
          }
        },
      ), 

            /// For Saved Items Tab
                   Container(
                    height: height * .3,
                    width: width * .9,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Center(child: Text('No Saved items yet ' , style: GoogleFonts.robotoFlex(fontSize: 24 , color: Colors.white , fontWeight: FontWeight.w500),)),
                            Icon(Icons.production_quantity_limits_rounded , size: 48, color: Color.fromARGB(255, 122, 210, 35),)
        
                        ],
                      )
                    ),
                  ),
                    
                
                  
              ]),
            )
      
             ],
           
           ),
        ),
      ),
    );
  }

                    // Custom Widgets

        // onPop Functionality
onPop(){
    BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());

    if(bottomNavigationController.selectdIndex != 0 ){
    Get.to(NavigationPage());
    bottomNavigationController.changeIndex(0) ; 
}else{
  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}}


                // Favorites Page Container
  //  favoritesPageContainer({
  //   width , height , color , projectTitle ,projectLocation , projectPrice , required List<String> imageUrl ,  ownerInfo , projectDescription}){
   favoritesPageContainer({width , height , color , projectTitle ,projectLocation , projectPrice ,  imageUrl ,  ownerInfo , projectDescription ,required property}){
  
   return  Padding(
     padding: EdgeInsets.symmetric(horizontal : width *.025 ,),

      // With objects
    
      child: InkWell(
      onTap: (){
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
                  color: Color.fromARGB(255, 137, 125, 124),
                  // image: DecorationImage(
                  //   image: NetworkImage(imageUrl.first),
                  // fit: BoxFit.cover
                  // ),
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
