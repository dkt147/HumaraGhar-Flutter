import 'package:HumaraGhar/API%20testing/local%20db%20testing/user_service.dart';
import 'package:HumaraGhar/routes/routes_name.dart';
import 'package:HumaraGhar/utils/app_colors.dart';
import 'package:HumaraGhar/view-model/navbar_controller/navbar_controller.dart';
import 'package:HumaraGhar/view/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SideNavigationDrawer extends StatefulWidget {
  const SideNavigationDrawer({super.key});

  @override
  State<SideNavigationDrawer> createState() => _SideNavigationDrawerState();
}

class _SideNavigationDrawerState extends State<SideNavigationDrawer> {

  final screens = [
    'Home' , 'Projects' , 'Search' , 'Favorites' , 'Profile' , 'About HumaraGhar' , 'Terms & Privacy Policy'
  ]; 

  bool isSelected = true;

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    
    late BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Drawer(
          
              backgroundColor: AppColors.navigationDrawerColor,
              shape:ContinuousRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)  , topRight:   Radius.circular(30) )),
              width: width * .7,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal : width * .04 ),
                child: SingleChildScrollView(
                  child: Column(
                    
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * .02,),
                            Center(
                              child: Container(
                                child:
                                
                                Image.asset('assets/images/applogo.png',  height: height * .08  , width: width * .7)),
                            ), 
                                 SizedBox(height: height * .02,),
                              InkWell(
                                onTap: (){
                                  Get.toNamed(RouteName.profileSettingsView);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text('Ali Qureshi', style: GoogleFonts.robotoFlex(fontSize: 16 , fontWeight: FontWeight.w700),),
                                 ),
                                 CircleAvatar(
                                  radius: width * .06,
                                  backgroundImage: AssetImage('assets/images/MenProfile.jpg'),
                                 ),
                                ],),
                              ),   
                                 SizedBox(height: height * .02,),
                    Divider(color: Colors.blue,),
                    
                    
                      
                  navigationDrawerMenu(
                    title: 'Home' , width : width * .02 , icon : Icons.home , 
                    onTap: (){ 
                      Get.to(NavigationPage());
                      bottomNavigationController.changeIndex(0) ;
                      } ),
                  navigationDrawerMenu(
                    title: 'Projects' , width : width * .02 , icon : Icons.business , 
                    onTap: (){ 
                      Get.to(NavigationPage());
                      bottomNavigationController.changeIndex(1) ;
                      } ),
                  navigationDrawerMenu(
                    title: 'Search' , width : width * .02 , icon : Icons.search , 
                    onTap: (){ 
                      Get.to(NavigationPage());
                      bottomNavigationController.changeIndex(2) ;
                      } ),
                  navigationDrawerMenu(title: 'Favorites' , width : width * .02 , icon :Icons.favorite ,
                    onTap: (){ 
                      Get.to(NavigationPage());
                      bottomNavigationController.changeIndex(3) ;
                      } ),
                  navigationDrawerMenu(
                    title: 'Profile' , width : width * .02 , icon :Icons.person ,onTap: (){ 
                      Get.to(NavigationPage());
                      bottomNavigationController.changeIndex(4) ;
                      } ),
                  Divider(color: Colors.blue,),
                  
                  navigationDrawerMenu(title: 'Post Ad' , width : width * .02 , icon :Icons.post_add ,onTap: (){ 
                      Get.toNamed(RouteName.postAdView);
                      }),
                  
                  Divider(color: Colors.blue,),
                
                  navigationDrawerMenu(title: 'About HumaraGhar' , width : width * .02 , icon : Icons.info  , 
                  onTap: (){
                    Get.toNamed(RouteName.aboutView);
                  } ),  
                  
                  navigationDrawerMenu(title: 'Terms & Privacy policy' , width : width * .02 , icon : Icons.document_scanner , 
                  onTap: (){
                    Get.toNamed(RouteName.termsConditionsView);
                  } ),  
                  navigationDrawerMenu(title:'Sign Out'  , width : width * .02 , icon : Icons.logout , color: Colors.red,
                  onTap: (){
                    UserService().clearPrefs();
                    Get.toNamed(RouteName.loginScreen);
                  } ),  
                    
                    
                           
                    ]
                    ),
                ),
              )
                          
        ),
      ),
    );

    
  }


  navigationDrawerMenu( {title , width, icon , routeName  , Color? color ,  VoidCallback? onTap} ){
    return InkWell(
        onTap: onTap,
          
          child: Padding(       
                    padding:  EdgeInsets.symmetric(horizontal : 8.0 , vertical: 14),
                    child: Row(
                      children: [
                        Icon(icon , color : color?? Colors.black ,  size: 22,),
                        SizedBox(width: width,),
                        Text(title , style: GoogleFonts.robotoFlex(fontSize: 16 ,
                        color:  color?? Colors.black),),
                      ],
                      
                    ),
                  ),
    );
  }



}