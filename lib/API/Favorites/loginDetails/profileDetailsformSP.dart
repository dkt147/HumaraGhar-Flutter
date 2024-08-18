

import 'package:HumaraGhar/API/local%20db%20testing/user_service.dart';

import 'package:HumaraGhar/view-model/navbar_controller/navbar_controller.dart';
import 'package:HumaraGhar/view/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfileDetailsFromSPView extends StatefulWidget {
  const ProfileDetailsFromSPView({Key? key}) : super(key: key);

  @override
  State<ProfileDetailsFromSPView> createState() => _ProfileDetailsFromSPViewState();
}

class _ProfileDetailsFromSPViewState extends State<ProfileDetailsFromSPView> {
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
    //     double height = MediaQuery.of(context).size.height ;
    // double width = MediaQuery.of(context).size.width ;
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Name: ${_userId ?? "Loading..."}'), // Display "Loading..." until future completes
          SizedBox(height: 12),
          // Add more widgets here
          ElevatedButton(onPressed: (){
            UserService().clearPrefs();
            Get.back();
          }, child: Text('Back')),
    
      ])
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