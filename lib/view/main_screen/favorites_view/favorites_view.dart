// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:HumaraGhar/API/Favorites/getFavoriteProperties/get_fav_handeler.dart';
import 'package:HumaraGhar/API/Favorites/getFavoriteProperties/get_favorite_model.dart';
import 'package:HumaraGhar/API/GetSingleProperty/get_single_property_view.dart';
import 'package:HumaraGhar/API/local%20db%20testing/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:HumaraGhar/utils/Navigation_Drawer/navigation_drawer.dart';
import 'package:HumaraGhar/constants/background_container.dart';
import 'package:HumaraGhar/view-model/navbar_controller/navbar_controller.dart';
import 'package:HumaraGhar/view/navbar/navbar.dart';

class FavoritesView extends StatefulWidget {

  
  const FavoritesView({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> with TickerProviderStateMixin {
 
 late Future<String> _userIdFuture;
  String? _userId;

  @override
  void initState() {
    super.initState();
    _userIdFuture = UserService().getUserDataFromPrefs().then((value) => value!.userID.toString());
    _userIdFuture.then((value) {
      setState(() {
        _userId = value;
      });
    });
  }





  @override
  Widget build(BuildContext context) {
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
            title : Text('Favorites'),
          ),

       body: FutureBuilder<FavoritePropertiesModel>(
        future: FavoriteService().fetchMyFavProperties(_userId.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }else if (snapshot.hasData || snapshot.data!.response!.isEmpty) {
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
             itemCount: snapshot.data!.response!.length,
              itemBuilder: (context, index) {

                final favorite = snapshot.data!.response![index];
                return Padding(padding: EdgeInsets.only(top: height * 0.012) ,
                // Text(favorite.propertyName.toString()) ;
                child :  favoritesPageContainer(
                        propertyId: favorite.propertyId ,
                        width: width * .95,
                        height: height * .2,
                        projectTitle: favorite.propertyName,
                        projectLocation : favorite.propertyId ,
                        projectDescription : 'daaaaa',
                        projectPrice : '20000000',
                        imageUrl:  favorite.attachmentUrl,
                        ownerInfo:favorite.userName));
                  
                  },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          
        });
      },
      child: Icon(Icons.update),
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
   favoritesPageContainer({width , height , color , projectTitle ,projectLocation , projectPrice ,  imageUrl ,  ownerInfo , projectDescription , propertyId}){
  
   return  Padding(
     padding: EdgeInsets.symmetric(horizontal : width *.025 ,),

      // With objects
    
      child: InkWell(
      onTap: (){
        Get.to(GetSinglePropertyView(propertyId: propertyId));
        // print(propertyId);
        // print(projectPrice);
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
        }
