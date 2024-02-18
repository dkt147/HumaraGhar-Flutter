import 'package:HumaraGhar/utils/app_colors.dart';
import 'package:HumaraGhar/view-model/navbar_controller/navbar_controller.dart';
import 'package:HumaraGhar/view/main_screen/favorites_view/favorites.dart';
import 'package:HumaraGhar/view/main_screen/home_view/home_view.dart';
import 'package:HumaraGhar/view/main_screen/profile_view/profile_view.dart';
import 'package:HumaraGhar/view/main_screen/projects_view/projects_view.dart';
import 'package:HumaraGhar/view/main_screen/search_view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationPage extends StatelessWidget {
   NavigationPage({super.key});

  final screens = [
    HomeView(),
    ProjectsView(),
    SearchView(),
    FavoritesView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());
    return Scaffold(
      body: 
      // bottomNavigationController.changeLoadingState(bottomNavigationController.isLoading.value)? 
        // Center(child: CircularProgressIndicator(),)
      // :  
      Obx(
        () => IndexedStack(
          index : bottomNavigationController.selectdIndex.value ,
          children: screens, 
          ),
      ),bottomNavigationBar: Obx( () =>
         Theme (
           data: ThemeData(
          //   pageTransitionsTheme: PageTransitionsTheme(
          //     builders: {
                  
          //   TargetPlatform.windows :ZoomPageTransitionsBuilder(),
          //   TargetPlatform.android:CupertinoPageTransitionsBuilder(),
          //   // ZoomPageTransitionsBuilder(),
          //   TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          // },
          //   ),
          canvasColor: AppColors.BottomNavigationColor
          // canvasColor:  Color.fromARGB(255, 189, 201, 238),
        ),
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.shifting,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Color.fromARGB(255, 3, 93, 167),
            unselectedItemColor: Colors.black,
            onTap: (index) {
              bottomNavigationController.changeIndex(index);
             },
            currentIndex: bottomNavigationController.selectdIndex.value,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home) , label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.business_outlined), label: 'Projects'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
      ),
 )   );
  }
}