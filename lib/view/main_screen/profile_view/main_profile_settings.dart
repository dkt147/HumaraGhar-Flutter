import 'package:HumaraGhar/API/Favorites/postFavoriteProperties/GetUserProfile/getUserService.dart';
import 'package:HumaraGhar/API/Favorites/postFavoriteProperties/GetUserProfile/model.dart';
import 'package:HumaraGhar/API/local%20db%20testing/user_service.dart';
import 'package:HumaraGhar/constants/background_container.dart';
import 'package:HumaraGhar/view/main_screen/profile_view/my_properties/edit_profile.dart';
import 'package:flutter/material.dart';

class MainProfileSettingsView extends StatefulWidget {
  const MainProfileSettingsView({super.key});

  @override
  State<MainProfileSettingsView> createState() => _MainProfileSettingsViewState();
}

class _MainProfileSettingsViewState extends State<MainProfileSettingsView> {
  
  
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BackgroundContainer(
      child: Scaffold(
           appBar: AppBar(
          title: Text('Main Profile Settings'),
          actions: [
            FutureBuilder<GetUserProfileModel>(
            future: UserProfileService().getUserProfile(_userId.toString()) , // Replace userId with the actual user ID
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // If the Future is still loading, display a loading indicator
              // return Center(child: CircularProgressIndicator());
              return Container();
            } else if (snapshot.hasError) {
              // If an error occurred while fetching the data, display an error message
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              // If the data has been successfully fetched, display the user profile
              final userProfile = snapshot.data!.data!;
              return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(
                            id: userProfile.id,
                            name: userProfile.name,
                            email: userProfile.email,
                            contact: userProfile.phone,
                            password: userProfile.password,
                          ),
                        ),
                      );
                    },
                    child: Icon(Icons.edit, color: Colors.black),
                  );
                }
              },
            ),
            SizedBox(width: 12),
          ],
        ),
        // appBar: AppBar(
        //   title: Text('Main Profile Settings'),
        //   actions: [
        //     InkWell(
        //       onTap: (){
        //         // Get.to(EditProfileScreen(
        //         //   name: user,
        //         // ));
        //       },
        //       child: Icon(Icons.edit , color: Colors.black,)),
        //     SizedBox(width: 12,)
        //   ],
        //   ),
       
        body: SingleChildScrollView(
          child: FutureBuilder<GetUserProfileModel>(
          future: UserProfileService().getUserProfile(_userId.toString()) , // Replace userId with the actual user ID
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // If the Future is still loading, display a loading indicator
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // If an error occurred while fetching the data, display an error message
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              // If the data has been successfully fetched, display the user profile
              final userProfile = snapshot.data!.data!;
              return Center(
                child: Column(
                
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * .07,),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/MenProfile.jpg') 
                      // Image.asset(),
                    ),
                
                    SizedBox(height: height * .05,),
                        ProfileTextField(width,'ID', userProfile.id , Icons.numbers),
                    // Text('ID: ${userProfile.data!.id}',style: GoogleFonts.robotoFlex(fontSize: 24, color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500)),
                    SizedBox(height: height * .03,),
                    ProfileTextField(width, 'Name', userProfile.name , Icons.person),
                    // Text('Name: ${userProfile.data!.name}' , style: GoogleFonts.robotoFlex(fontSize: 24, color: Color.fromARGB(255, 26, 15, 15), fontWeight: FontWeight.w500)),
                    SizedBox(height:height * .03,),
                    ProfileTextField(width, 'Phone No.',userProfile.phone, Icons.call),
                    // Text('Email: ${userProfile.data!.email}', style: GoogleFonts.robotoFlex(fontSize: 24, color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500)),
                    SizedBox(height:height * .03,),
                    ProfileTextField(width, 'Email', userProfile.email, Icons.email),
                    SizedBox(height:height * .03,),
                    // ProfileTextField(width, height, userProfile.password , ' Password' , 20),
                    ProfileTextField(width,  'Password', userProfile.password , Icons.lock),
                    SizedBox(height:height * .03,),
                    
                      // RoundButton(title: 'Edit Profile', onTap: (){
                      //   Get.to(
                      //     EditProfileScreen(
                      //       id: userProfile.id,
                      //       name: userProfile.name,
                      //       email: userProfile.email,
                      //       contact: userProfile.phone,
                      //       password : userProfile.password
                      //     )
                      //   )    ;
                      // }, loading: false)
                  ],
                ),
              );
            }
          },
                ),
        ),
      ));
  }


  Container ProfileTextField(double width , label , initialValue ,IconData prefixIcon ) {
    return Container(
                width: width * .9,
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all()
                ),
              
            child: TextFormField(
              readOnly: true,
              initialValue: initialValue ,
              decoration: InputDecoration(
                label: Text(label , style: TextStyle(color:const Color.fromARGB(255, 23, 55, 82),),),
                prefixIcon: Icon(prefixIcon ,  color: const Color.fromARGB(255, 23, 55, 82),) ,
                border: InputBorder.none
              ),
            ),
          );
  }

  // Container ProfileTextField(double width, double height,  data , label , double fontsize) {
  //   return Container(
  //                 width: width * .9,
  //                 height: 60,
  //                 alignment: Alignment.centerLeft,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(8),
  //                   border: Border.all()
  //                 ),
  //                 child: Padding(
  //                   padding: const EdgeInsets.symmetric( horizontal:  10.0),
  //                   child: Text('${label}: ${data}',style: GoogleFonts.robotoFlex(fontSize: fontsize , color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500)),
  //                 ),
                 
  //               );
  // }
}