


import 'package:HumaraGhar/view/auth/login-view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2) , (){
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
    });
    // TODO: implement initState
    super.initState();
  }

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