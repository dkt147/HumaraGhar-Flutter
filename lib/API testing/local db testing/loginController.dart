import 'package:HumaraGhar/API%20testing/local%20db%20testing/user_service.dart';
import 'package:HumaraGhar/model/login_model.dart';
import 'package:HumaraGhar/model/user_model.dart';
import 'package:HumaraGhar/view/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {
    String baseUrl = 'https://cybernsoft.com/hg/';
  String signupUrl = 'signup.php';
  String loginUrl= 'login.php';
  Future<void> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl + loginUrl),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final dynamic jsonResponse = json.decode(response.body);
        final loginResponse = LoginResponse.fromJson(jsonResponse);

        if (loginResponse.status == 1) {
          final user = UserModel(
            userID: loginResponse.response['id'],
            userName: loginResponse.response['name'],
            email: loginResponse.response['email'],
            isLogin: true
          );


          // Navigate to the next screen
          Get.offAll(() => NavigationPage());
        } else {
          // Show error message
          Get.snackbar(
            'Login Failed',
            loginResponse.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      // Handle exceptions
      print(e.toString());
      Get.snackbar(
        'Error',
        'Failed to login. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
