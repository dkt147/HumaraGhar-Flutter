import 'package:HumaraGhar/API%20testing/local%20db%20testing/user_service.dart';
import 'package:HumaraGhar/components/round_button.dart';
import 'package:HumaraGhar/routes/routes_name.dart';
import 'package:HumaraGhar/utils/Navigation_Drawer/navigation_drawer.dart';
import 'package:HumaraGhar/utils/background_container.dart';
import 'package:HumaraGhar/view-model/navbar_controller/navbar_controller.dart';
import 'package:HumaraGhar/view/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
               systemOverlayStyle: SystemUiOverlayStyle(
                 statusBarColor: Color.fromARGB(255, 172, 211, 206),
               ),),
              body: SingleChildScrollView(
                child: Padding(
                  padding:    EdgeInsets.symmetric( horizontal : width * .05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                      Text('Profile' , style: GoogleFonts.roboto(fontWeight:  FontWeight.w700 , fontSize: 28 , color: Colors.white),),
                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              children: [
                                  Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Text('Ali Qureshi', style: GoogleFonts.robotoFlex(fontSize: 18 , color: Colors.white , fontWeight: FontWeight.w600),),
                                   ),
                              ],
                          ),
        
                          Container(
                            height: height * .1,
                            width: width * .19,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                                 image: DecorationImage(image:  AssetImage('assets/images/MenProfile.jpg'),
                                 fit: BoxFit.cover
                           )))
                           
                      
                        ],),
                        
                        SizedBox(height: height * .03,),
        
                        Divider(color: const Color.fromARGB(255, 255, 254, 254),),
      
                                //  Profile Settings
                        profileMenuButtons(
                          height: height * .08,
                          leadingIcon: Icon(Icons.settings , color: Colors.white,),
                          title: 'Settings',
                          onTap: (){
                            Get.toNamed(RouteName.profileSettingsView);
                            }),
      
                                // Contatact Form Bottom Sheet
                        profileMenuButtons(
                          height: height * .08,
                          leadingIcon: Icon(Icons.phone , color: Colors.white,),
                          title: 'Contact Us',
                          onTap: (){
                            Get.bottomSheet(
                              
                              Container(
                                
                              height: height * 222,
                              width: width * 9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(12) , topRight: Radius.circular(12)),
                               color: Color.fromARGB(255, 172, 211, 206),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(height: 2,),
                                    Center(
                                      child: Container(
                                        width: width * .4,
                                        height: height * .01,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 72, 70, 70),
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                      ),
                                    ),
                                formTextField(title: 'Name' , hintText: 'Your Name here' , keyboardType: TextInputType.text ),
                                formTextField(title: 'Phone Number' , hintText: 'Your Contact Number' ,  keyboardType: TextInputType.number),
                                formTextField(title: 'Email Address' , hintText: 'Your email here' , keyboardType: TextInputType.emailAddress),
                                formTextField(title: 'Subject' , hintText: 'General Inquiry',  keyboardType: TextInputType.text),
                                formTextField(title: 'Message' , hintText: 'What would you like to say?', keyboardType: TextInputType.text),
                                    SizedBox(height: 18,),
                                    RoundButton(title: 'Send your Message', onTap: (){Navigator.pop(context);}, loading: false),
                                    SizedBox(height: 18,),
                                  ],
                                ),
                              ),
                            ));
                          }
      
                        ),
      
      
                              // Feedback Dialog
                        profileMenuButtons(
                          height: height * .08,
                          leadingIcon: Icon(Icons.feedback , color: Colors.white,),
                          title: 'Feedback',
                          onTap: (){Get.defaultDialog(
                           
                            backgroundColor:Color.fromARGB(255, 172, 211, 206),
                            title: "How you feel about this app?",
                            titleStyle: GoogleFonts.roboto(color: Colors.black , fontSize: 22),
                            titlePadding: EdgeInsets.only(bottom : 20 , top : 10 , left: 20 , right: 20),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: (){
                                    print('Happy');
                                    Navigator.pop(context);
                                  },
                                  child: Text('Happy' , style: GoogleFonts.robotoFlex(
                                    color: Colors.black,
                                    fontSize: 20
                                  ),),
                                ),
                                   InkWell(
                                         onTap: (){
                                          Navigator.pop(context);
                                         print('Average');
                                         },
                                     child: Text('Average' , 
                                     style: GoogleFonts.robotoFlex(
                                          color: Colors.black,
                                          fontSize: 20
                                      ),),
                                   ),
                                   InkWell(
                                         onTap: (){
                                          print('Bad');
                                          Navigator.pop(context);
                                         },
                                     child: Text('Bad' , style: GoogleFonts.robotoFlex(
                                             color: Colors.black,
                                             fontSize: 20
                                          ),),
                                   ),
                              ],
                            )
                           );}
                       
                        ),
      
                               // Terms And Condition
                        profileMenuButtons(
                          height: height * .08,
                          leadingIcon: Icon(Icons.document_scanner , color: Colors.white,),
                          title: 'Terms and Privacy Policy',
                          onTap: (){Get.toNamed(RouteName.termsConditionsView);}
                        ),
                        // Divider(color: const Color.fromARGB(255, 255, 254, 254),),
                      
                          Divider(color: const Color.fromARGB(255, 255, 254, 254),),
    
                            SizedBox(height: 20,),
    
    
                            postAdContainer(
                         width :  width * .96,
                        // height : height * .18,
                      ),
                      // Divider(color: const Color.fromARGB(255, 255, 254, 254),),
                               // Log out
                          profileMenuButtons(
                          height: height * .08,
                          leadingIcon: Icon(Icons.logout , color: Colors.white,),
                          title: 'Sign Out',
                          onTap: (){
                              UserService().clearPrefs();
                              onPop();
                        Get.toNamed(RouteName.loginScreen);}
                        ),
                    ],
                  ),
                ),
              ),
          
        ),
      ),
    );
  }

  profileMenuButtons({height , title , leadingIcon , function , Function()? onTap}  ){
    return   InkWell( 
              onTap: onTap,
                  child: Container(
                    
                    // color: Colors.white,
                    height: height * 1,
                    child  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          leadingIcon,
                          SizedBox(width: 12,),
                          Text(title , style: GoogleFonts.robotoFlex(fontSize: 16 , color: Colors.white),),
                        ],),
                        
                        Icon(Icons.arrow_forward_ios , size: 15 , color: Colors.white,)
                      ],
                    )
                  ),
                );
              
  }

 formTextField({title , hintText , keyboardType} ){
      return Padding(padding: const EdgeInsets.symmetric(vertical :  12.0 , horizontal: 22),
        child: Container(
                                  
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                                          
              Text(title , style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),),
              TextField(
                  keyboardType: keyboardType ,
                  decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: GoogleFonts.poppins(fontSize: 14 )
                                              
                ),
               ),
             ],
           ),
        ),
      );
      
    }

 HomePageContainer({width , height , color , containerHeading}){
   return  Container(      
    width: width,
      height: height,
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
         color: Colors.black45,
      ),

    child: Padding(
       padding: const EdgeInsets.symmetric( horizontal : 12.0 , vertical: 4), 
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(containerHeading , style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white)) ,
              TextButton(onPressed: (){}, child: Text('View All' , style: TextStyle(color : Colors.blue , fontWeight: FontWeight.bold) ,)) 
            ],
          ),

       
        ],
      ),
    ),
    );
  }


  postAdContainer({width , height , color , containerHeading}){
   return  Container(      
    width: width,
    height: 120,
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
         color: Colors.black45,
      ),

    child: Padding(
       padding: const EdgeInsets.symmetric( horizontal : 12.0 , vertical: 4), 
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Align(
                alignment: Alignment.center,
                child: Text('Looking to sell or rent your property?' , style: GoogleFonts.roboto(fontSize: 16 ,  fontWeight: FontWeight.w500 , color: Colors.white , ),)),
              SizedBox(height: 12,),
            //   Text('just post an Ad and reach out to potential buyer or tenants.' , textAlign: TextAlign.center ,style: GoogleFonts.roboto(fontSize: 14 , fontWeight: FontWeight.w300 , color: Colors.white ,  ),),
            // SizedBox(height: 8,), 
            RoundButton(title: 'Post An Ad', onTap: (){
              Get.toNamed(RouteName.postAdView);
              }, 
              loading: false ,
              height: 45,)
            
          ],
        ),
      ),
    ),
    );
  }

onPop(){
    BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());

    if(bottomNavigationController.selectdIndex != 0 ){
    Get.to(NavigationPage());
    bottomNavigationController.changeIndex(0) ; 
}else{
  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}


}
  


}