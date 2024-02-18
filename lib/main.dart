
import 'package:HumaraGhar/API%20testing/Favorites/getFavoriteProperties/get_favorite_property_view.dart';
import 'package:HumaraGhar/API%20testing/Favorites/postFavoriteProperties/favorite_view.dart';
import 'package:HumaraGhar/API%20testing/Properties/getProperties/fetchPropertyListView.dart';
import 'package:HumaraGhar/firebase_options.dart';
import 'package:HumaraGhar/routes/app_routes.dart';
import 'package:HumaraGhar/utils/app_colors.dart';
import 'package:HumaraGhar/view/auth/login-view/login_view.dart';
import 'package:HumaraGhar/view/navbar/navbar.dart';
import 'package:HumaraGhar/view/splash-screen/splash_screen.dart';
import 'package:HumaraGhar/API%20testing/property%20testing/ui.dart';
import 'package:HumaraGhar/view/test_screens/property_list.dart';
import 'package:HumaraGhar/view/test_screens/testScaffold.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);



  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp , DeviceOrientation.portraitDown]).then((value) {
     
     FirebaseMessaging.onBackgroundMessage( _firebaseMessagingBackgroundHandeler);
     runApp(const MyApp());
  } );

  // runApp(const MyApp());
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  
    return GetMaterialApp(
      
      
      debugShowCheckedModeBanner: false,

      title: 'Humara Ghar',
      theme: ThemeData(
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
      // home: MyImagePickerScreen(),
      // home: Test(),
      // home: PostAdView(),
      // home: ChoiceChipWidget(),
      // home: NavigationPage(),
      // home: AddFavoritePropertyScreen(),
      // home: ToggleButton(),
      // home: ShowWithVideoSwitch(),
      home: SplashScreen(),
      // home: ProjectsImageSlider(),
      // home: test(),
      // home: MyWidget(),
      // home: HomeTabContainer(),
      // home: PlotTabContainer(),
      // home: CommercialTabContainer(),
      // home: PurposeChoiceChip(),
      // home: selectMultiValue(),
      // home: MultiSelectDropDownScreen(),
      // home: DropDownButton(),
      // home: testScaffold(),
      // home: PropertyListScreen(),
      // home: PropertiesListingPage(),
      // home: AddFavoritePropertyScreen(),
      // home: FavoritePropertiesPage(),
      // home: UserProfileScreen(),
      // home: PropertyListScreen(),
      // home: PropertyListModelView(),
      // home: LoginScreen(),
      // home: LoginScreenNew(),
      // home: SignupScreenTest(),
      // home: AdDescriptionContainer(),
      
      
      
      getPages: AppRoutes.appRoutes(),
    );
  }
  
  testScaffold() {}
}

