
import 'dart:convert';
import 'package:HumaraGhar/model/user_model.dart';
import 'package:HumaraGhar/utils/app_colors.dart';
import 'package:HumaraGhar/view/auth/login-view/login_view.dart';
import 'package:HumaraGhar/view/navbar/navbar.dart';
import 'package:HumaraGhar/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' ;
import 'package:http/http.dart' as http ;

class AuthService{

  String baseUrl = 'https://cybernsoft.com/hg/';
  String signupUrl = 'signup.php';
  String loginUrl= 'login.php';

  /************* Sign up *************/

//   void signup(String email , String password , String contact) async {
//   try{
//       final response = await http.post(
//       Uri.parse(baseUrl + signupUrl),
//       body: {
//         'email' : email,
//         'password' : password,
//         'contact' : contact
//       }
//     );

//     if(response.statusCode == 200){
//       var data = jsonDecode(response.body.toString());
//        var loginResponse = data[0];
//       print('Account created successfully');
//            Get.toNamed(RouteName.loginScreen);
                      
                      
//     }else{
//       print('failed');
//       // print('${loginResponse['message']}');
//     }
      
//   }catch(e){
//     if(kDebugMode){
//       print('Error ${e.toString()}');
//     }
//     Get.snackbar('Login Failed' , e.toString());
//   }
//   }
 

//   /************* Login *************/

//   void login(String email , String password) async {
//   try{
   
//       final response = await http.post(
//       Uri.parse(baseUrl + loginUrl),
//      body: {
//         'email' : email,
//         'password' : password,
//       }
//     );

//     // if(response.statusCode == 200){
//       var data = jsonDecode(response.body.toString());
//       print('Login successfully');
//       Get.off(NavigationPage());
//       Get.snackbar('Login Successfull', 'Enjoy finding your new home');
//     // }else{
//     //   print('failed');

//     // }

//   }catch(e){
//     if(kDebugMode){
//       Get.snackbar('Login Failed' , e.toString());
      
//       print('Error ${e.toString()}');
//     }
//   }
//  }



    // NEW AUTH METHOD
  
    /************* Sign up *************/


  Future<void> signup(String name , String email , String password , String phone , BuildContext context) async {
    final response = await http.post(
      Uri.parse(baseUrl + signupUrl),
      body: {
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
      },
    );
    
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      for (var item in jsonResponse) {
        final Map<String, dynamic> signupResponse = item;
        if (signupResponse['status'] == 1) {
          // Signup successful, handle response data
          print('Signup Successful: ${signupResponse['message']}');
          if (signupResponse.containsKey('response')) {
            print('User ID: ${signupResponse['response']['id']}');
            print('Name: ${signupResponse['response']['name']}');
            print('Email: ${signupResponse['response']['email']}');
          }
          // Navigate to the login screen or do something else
          Get.to(LoginScreen());
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('Account created successfully', style: TextStyle(color: Colors.black , fontWeight: FontWeight.w500),)), 
          backgroundColor: AppColors.BottomNavigationColor,));
        } else {
          // Signup failed, show error message
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: AppColors.BottomNavigationColor ,
                title: Text("Signup Failed"),
                content: Text(signupResponse['message']),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      print('State: ${signupResponse['status']}');
                    },
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
        }
      }
    } else {
      // Handle other HTTP status codes
      throw Exception('Failed to signup');
    }
  }










    /************* Login *************/

     Future<void> login(String email , String password , BuildContext context ) async {
    
    final response = await http.post(
      Uri.parse(baseUrl + loginUrl),
      body: {
        'email': email,
        'password': password,
      },
    );

    UserModel user;
    if (response.statusCode == 200) {
      final dynamic jsonResponse = json.decode(response.body);
      if (jsonResponse is List) {
        // If the response is a list, handle each item individually
        for (var item in jsonResponse) {
          final loginResponse = LoginResponse.fromJson(item);
          handleLoginResponse(loginResponse , context);
        }
      } else if (jsonResponse is Map<String, dynamic>) {
        // If the response is a single object, handle it directly
        final loginResponse = LoginResponse.fromJson(jsonResponse);
        handleLoginResponse(loginResponse , context);
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      // Handle other HTTP status codes
      throw Exception('Failed to login');
    }
  }
    void handleLoginResponse(LoginResponse loginResponse , BuildContext context) {
    if (loginResponse.status == 1) {
      // Login successful, handle response data
      // print(UserModel().userID);
      UserModel user =  UserModel(userID: loginResponse.response['id'], userName: loginResponse.response['name'], email: loginResponse.response['email']);
      print('Login Successful: ${loginResponse.message}');
      print('User ID: ${loginResponse.response['id']}');
      print('Name: ${loginResponse.response['name']}');
      print('Email: ${loginResponse.response['email']}');
      print('Status: ${loginResponse.status}');
      // Navigate to the next screen or do something else
      // Get.off(NavigationPage());
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigationPage()));
    }
    
    
     else {
      // Login failed, show error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.BottomNavigationColor ,
            title: Text("Login Failed"),
            content: Text(loginResponse.message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

      /************* Get User Profile *************/


  Future<void> getUserProfile(String id , BuildContext context) async {
    final response = await http.post(
      Uri.parse(baseUrl + signupUrl),
      body: {
        'name': id,
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      for (var item in jsonResponse) {
        final Map<String, dynamic> signupResponse = item;
        if (signupResponse['status'] == 1) {
          // Signup successful, handle response data
          print('Signup Successful: ${signupResponse['message']}');
          if (signupResponse.containsKey('response')) {
            print('User ID: ${signupResponse['response']['id']}');
          }
          // Navigate to the login screen or do something else
          Get.to(LoginScreen());
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('Your Profile is cooking', style: TextStyle(color: Colors.black , fontWeight: FontWeight.w500),)), 
          backgroundColor: AppColors.BottomNavigationColor,));
        } else {
          // Signup failed, show error message
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: AppColors.BottomNavigationColor ,
                title: Text("Signup Failed"),
                content: Text(signupResponse['message']),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      print('State: ${signupResponse['status']}');
                    },
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
        }
      }
    } else {
      // Handle other HTTP status codes
      throw Exception('Failed to signup');
    }
  }



  }
