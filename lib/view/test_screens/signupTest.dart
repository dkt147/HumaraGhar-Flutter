import 'dart:convert';
import 'package:HumaraGhar/view/test_screens/testScaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupScreenTest extends StatefulWidget {
  @override
  _SignupScreenTestState createState() => _SignupScreenTestState();
}

class _SignupScreenTestState extends State<SignupScreenTest> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> signup() async {
    final response = await http.post(
      Uri.parse('https://cybernsoft.com/hg/signup.php'),
      body: {
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'phone': phoneController.text,
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
          // Get.to(LoginScreenNew());
        } else {
          // Signup failed, show error message
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: signup,
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
