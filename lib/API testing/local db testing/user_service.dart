// import 'package:HumaraGhar/model/user_model.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class UserService extends GetxService {
//   late SharedPreferences _prefs;

//   Future init() async {
//     _prefs = await SharedPreferences.getInstance();
//   }

//   Future<void> saveUser(UserModel user) async {
//     await _prefs.setString('email', user.email);
//     await _prefs.setString('userId', user.userID);
//     await _prefs.setString('name', user.userName);
//     await _prefs.setBool('isLoggedIn', true); // Set isLoggedIn to true
//   }

//   UserModel? getUser() {
//     final email = _prefs.getString('email');
//     final userId = _prefs.getString('userId');
//     final name = _prefs.getString('name');

//     if (email != null && userId != null && name != null) {
//       return UserModel(email: email, userID: userId, userName: name);
//     } else {
//       return null;
//     }
//   }

//   bool isLoggedIn() {
//     return _prefs.getBool('isLoggedIn') ?? false;
//   }

//   Future<void> logout() async {
//     await _prefs.clear(); // Clear all stored data upon logout
//   }
// }


import 'package:HumaraGhar/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService{
  
  
Future<void> storeUserDataInPrefs(UserModel user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('userId', user.userID);
  prefs.setString('userName', user.userName);
  prefs.setString('userEmail', user.email);
  prefs.setBool('isLogin', user.isLogin);
}

Future<UserModel?> getUserDataFromPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString('userId');
  String? userName = prefs.getString('userName');
  String? userEmail = prefs.getString('userEmail');
  bool? isLogin = prefs.getBool('isLogin');

  if (userId != null && userName != null && userEmail != null && isLogin != null) {
    return UserModel(userID: userId, userName: userName, email: userEmail, isLogin: isLogin);
  } else {
    return null;
  }
}

  Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId')?? '';
  }

 getID() async {
  await getUserId().then((userId){
    
  // Now you can safely use userId as a string
  return userId;
  });
  
}
Future<void> clearPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear(); // Clear all stored data upon logout
}





}

