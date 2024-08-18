
import 'package:HumaraGhar/API/local%20db%20testing/user_service.dart';
import 'package:flutter/material.dart';
import 'package:HumaraGhar/API/Favorites/postFavoriteProperties/GetUserProfile/getUserService.dart';
import 'package:HumaraGhar/API/Favorites/postFavoriteProperties/GetUserProfile/model.dart';

class UserProfileScreen extends StatefulWidget {

  UserProfileScreen();

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
 
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
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: FutureBuilder<GetUserProfileModel>(
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
            final userProfile = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('User ID: ${userProfile.data!.id}'),
                  Text('Name: ${userProfile.data!.name}'),
                  Text('Email: ${userProfile.data!.email}'),
                  Text('Phone: ${userProfile.data!.phone}'),
                  // Add more user details as needed
                ],
              ),
            );
          }
        },
      ),
    );
  }
} 