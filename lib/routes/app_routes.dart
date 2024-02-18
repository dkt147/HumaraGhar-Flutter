
import 'package:HumaraGhar/routes/routes_name.dart';
import 'package:HumaraGhar/view/auth/forgetpassword_view/forgetpassword.dart';
import 'package:HumaraGhar/view/auth/login-view/login_view.dart';
import 'package:HumaraGhar/view/auth/signup-view/signup_view.dart';
import 'package:HumaraGhar/view/main_screen/app_policy_pages/about.dart';
import 'package:HumaraGhar/view/main_screen/app_policy_pages/terms&condition.dart';
import 'package:HumaraGhar/view/main_screen/favorites_view/favorites.dart';
import 'package:HumaraGhar/view/main_screen/home_view/home_view.dart';
import 'package:HumaraGhar/view/main_screen/post_ad/ad_view.dart';
import 'package:HumaraGhar/view/main_screen/profile_view/draft.dart';
import 'package:HumaraGhar/view/main_screen/profile_view/main_profile_settings.dart';
import 'package:HumaraGhar/view/main_screen/profile_view/my_properties/my_properties_view.dart';
import 'package:HumaraGhar/view/main_screen/profile_view/profile_settings.dart';
import 'package:HumaraGhar/view/main_screen/profile_view/profile_view.dart';
import 'package:HumaraGhar/view/main_screen/projects_view/projects_view.dart';
import 'package:HumaraGhar/view/main_screen/search_view/search_location.dart';
import 'package:HumaraGhar/view/main_screen/search_view/search_view.dart';
import 'package:HumaraGhar/view/main_screen/search_view/selectAgency.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';


class AppRoutes {

 static appRoutes () => [


  // -------------------- Auth Routes  -------------------- //

                // LoginScreen
    GetPage(
    name: RouteName.loginScreen , 
    page: () => LoginScreen(),
    // transition: Transition.leftToRightWithFade,
    // transitionDuration: Duration(milliseconds: 100),
    ),


    // SignupScreen
    GetPage(
    name: RouteName.signupScreen , 
    page: () => SignupScreen(),
    // transition: Transition.leftToRightWithFade,
    // transitionDuration: Duration(milliseconds: 100),
    ),

    
    // forgetPassword
    GetPage(
    name: RouteName.forgetPasswordScreen , 
    page: () => ForgetPassword(),
    // transition: Transition.leftToRightWithFade,
    // transitionDuration: Duration(milliseconds: 100),
    ),


  // -------------------- MainScreen Routing -------------------- //


                  // Home
    GetPage(
    name: RouteName.homeView , 
    page: () => HomeView(),transition: Transition.fadeIn),

                // Projects
  GetPage(
    name: RouteName.projectView , 
    page: () => ProjectsView(),transition: Transition.fadeIn),

                // Search
  GetPage(
    name: RouteName.searchScreen , 
    page: () => SearchView(),transition: Transition.fadeIn),

                // Favorites
  GetPage(
    name: RouteName.favoritesView , 
    page: () => FavoritesView(),transition: Transition.fadeIn),

                // Profile
  GetPage(
    name: RouteName.profileView , 
    page: () => ProfileView(),transition: Transition.fadeIn),


                    // ProfileSettings
  GetPage(
    name: RouteName.profileSettingsView , 
    page: () => ProfileSettings(),transition: Transition.fadeIn
    
    ),

                   // MainProfileSettings
  GetPage(
    name: RouteName.mainProfileSettingsView , 
    page: () => MainProfileSettingsView(),transition: Transition.fadeIn
    
    ),

                  // About
  GetPage(
    name: RouteName.aboutView , 
    page: () => AboutView(),transition: Transition.fadeIn),



                // Terms & Conditions
  GetPage(
    name: RouteName.termsConditionsView , 
    page: () => TermsCondition(),transition: Transition.fadeIn),




                  // Search Screen
  GetPage(
    name: RouteName.searchLocationView , 
    page: () => SearchLocationScreen(),transition: Transition.fadeIn),


   GetPage(
    name: RouteName.selectAgencyView , 
    page: () => SelectAgencyView(),transition: Transition.fadeIn),

              // Post Ad Screen

       GetPage(
    name: RouteName.postAdView , 
    page: () => PostAdView(),transition: Transition.fadeIn),

                  // Draft Screen

       GetPage(
    name: RouteName.draftView , 
    page: () => draftView(),transition: Transition.fadeIn),



                  // Draft Screen

       GetPage(
    name: RouteName.myProprtiesView , 
    page: () => MyPropertiesView(), transition: Transition.fadeIn),






  //       // Profile
  // GetPage(
  //   name: '/projectDetails' , 
  //   page: () => ProjectDetails(imageUrl: , projectTitle: projectTitle, projectLocation: projectLocation, projectPrice: projectPrice),
  //   transition: Transition.leftToRightWithFade,
  //   transitionDuration: Duration(milliseconds: 500),),






];

}