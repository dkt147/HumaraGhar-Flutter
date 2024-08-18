

import 'package:HumaraGhar/firebase_options.dart';
import 'package:HumaraGhar/constants/app_colors.dart';
import 'package:HumaraGhar/view/splash-screen/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  
  
  // Initialize UserService
SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp , DeviceOrientation.portraitDown]).then((value) {
     
     FirebaseMessaging.onBackgroundMessage( _firebaseMessagingBackgroundHandeler);
     runApp(const MyApp());
  } );
}


// entry point
@pragma('vm:entry-point')
// Top level function for background notification 
Future<void> _firebaseMessagingBackgroundHandeler(RemoteMessage message)async{
  await Firebase.initializeApp();
  print(message.notification!.title.toString());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  
    return GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Humara Ghar',
      theme: ThemeData(
        // colorSchemeSeed: Colors.amber,
        appBarTheme: AppBarTheme(
          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            )
          ),
            systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 172, 211, 206),
          ),

          backgroundColor: Colors.transparent,
         elevation: 0, 
         centerTitle: true,
         scrolledUnderElevation: 0
          
        ),
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blueColor),
        useMaterial3: true,
      ),
 
      // home : FontsTest(),
      home : SplashScreen(),
      // home : MapView()
      // home : GetCurrentLocaton()
    );
  }
  
}

