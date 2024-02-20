


import 'package:HumaraGhar/API%20testing/local%20db%20testing/user_service.dart';
import 'package:HumaraGhar/model/user_model.dart';
import 'package:HumaraGhar/view/auth/login-view/login_view.dart';
import 'package:HumaraGhar/view/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // @override
  // void initState() {
    
  //   Future.delayed(Duration(seconds: 2) , (){
  //     SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);


  //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
          
        
      
  //   });
  //   // TODO: implement initState
  //   super.initState();
  // }

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkLoginStatus();
  }

  void checkLoginStatus() async {
  // Fetch user data from shared preferences
  UserModel? user = await UserService().getUserDataFromPrefs();

  // Wait for 2 seconds before navigating, just like your delay
  await Future.delayed(Duration(seconds: 2));

  // Check if user data is available and user is logged in
  if (user != null && user.isLogin) {
    // If logged in, navigate to the home page
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigationPage()));
  } else {
    // If not logged in, navigate to the login page
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }}

  @override
  Widget build(BuildContext context) {
    return Container(
      
      
        decoration: const BoxDecoration(
             
          gradient: LinearGradient(
            colors: [
                Color.fromARGB(255, 115, 175, 170),
              Color.fromARGB(255, 208, 243, 255),
              Color.fromARGB(255, 115, 175, 170),
            ], 
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          
          )

        ) ,
        child: Center(child: Image(image: AssetImage('assets/images/applogo.png'))));
    
  }
}