import 'package:HumaraGhar/components/round_button.dart';
import 'package:HumaraGhar/routes/routes_name.dart';
import 'package:HumaraGhar/utils/Navigation_Drawer/navigation_drawer.dart';
import 'package:HumaraGhar/utils/background_container.dart';
import 'package:HumaraGhar/view-model/navbar_controller/navbar_controller.dart';
import 'package:HumaraGhar/view/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());    
  
    return BackgroundContainer(
      child: Scaffold(
         backgroundColor: Colors.transparent,
        drawer: SideNavigationDrawer(),
        appBar: AppBar(
            // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 172, 211, 206),),
          title: Text('Settings'), 
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
          
                profileSettingsTile(
                  onTapFunction: (){
                    Get.toNamed(RouteName.mainProfileSettingsView);
                  },
                  icon: Icons.person,
                  title: 'Profile Settings'
                ),
                Divider(color: Colors.white,),
        
                    profileSettingsTile(
                  onTapFunction: (){
                    Get.to(NavigationPage());
                    bottomNavigationController.changeIndex(3) ;},
                  icon: Icons.search,
                  title: 'My Saved Searches'
                ),
        
                 Divider(color: Colors.white,),
        
                    profileSettingsTile(
                  onTapFunction: (){
                    Get.to(NavigationPage());
                    bottomNavigationController.changeIndex(3) ;
                  },
                  icon: Icons.favorite,
                  title: 'My Favorites'
                ),
        
                 Divider(color: Colors.white,),
        
                    profileSettingsTile(
                  onTapFunction: (){
                    Get.toNamed(RouteName.myProprtiesView);},
                  icon: Icons.business_outlined,
                  title: 'My Properties'
                ),
        
                 Divider(color: Colors.white,),
        
                    profileSettingsTile(
                  onTapFunction: (){
                    Get.toNamed(RouteName.draftView);},
                  icon: Icons.drafts,
                  title: 'Drafts'
                ),
        
        
               Divider(color: Colors.white,),
              
        
                SizedBox(height: 22,),
            
            RoundButton( title: 'Go back', onTap: (){
              Get.back();
            } , loading: false,)
       
            
            ],
          ),
        ),
    
        
        
      ),
    );
  }


 profileSettingsTile({icon , title,  VoidCallback? onTapFunction}){
  return InkWell(
    onTap: onTapFunction,
    child: ListTile(
        leading: Icon(icon , color: Colors.white,),
        title: Text(title , style: TextStyle( color : Colors.white),),
      ),
  );
}

}