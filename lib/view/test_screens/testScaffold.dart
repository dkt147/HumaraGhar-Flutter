/*import 'dart:convert';
import 'package:HumaraGhar/view/test_screens/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class LoginScreenNew extends StatefulWidget {
  @override
  _LoginScreenNewState createState() => _LoginScreenNewState();
}

class _LoginScreenNewState extends State<LoginScreenNew> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final response = await http.post(
      Uri.parse('https://cybernsoft.com/hg/login.php'),
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      final dynamic jsonResponse = json.decode(response.body);
      if (jsonResponse is List) {
        // If the response is a list, handle each item individually
        for (var item in jsonResponse) {
          final loginResponse = LoginResponse.fromJson(item);
          handleLoginResponse(loginResponse);
        }
      } else if (jsonResponse is Map<String, dynamic>) {
        // If the response is a single object, handle it directly
        final loginResponse = LoginResponse.fromJson(jsonResponse);
        handleLoginResponse(loginResponse);
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      // Handle other HTTP status codes
      throw Exception('Failed to login');
    }
  }

  void handleLoginResponse(LoginResponse loginResponse) {
    if (loginResponse.status == 1) {
      // Login successful, handle response data
      print('Login Successful: ${loginResponse.message}');
      print('User ID: ${loginResponse.response['id']}');
      print('Name: ${loginResponse.response['name']}');
      print('Email: ${loginResponse.response['email']}');
      // Navigate to the next screen or do something else
    } else {
      // Login failed, show error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Login Failed Error"),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            ElevatedButton(
              onPressed: login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
*/

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;



// class UserProfileScreen extends StatefulWidget {
//   @override
//   _UserProfileScreenState createState() => _UserProfileScreenState();
// }

// class _UserProfileScreenState extends State<UserProfileScreen> {
//   String username = '';
//   String email = '';

//   Future<void> getUserProfile() async {
//     // API endpoint
//     String url = 'https://cybernsoft.com/hg/get_user.php';
//  // Form data
//   Map<String, String> formData = {
//     'id': '5', // replace '5' with the actual user ID
//   };

//   try {
//     // Make POST request
//     http.Response response = await http.post(
//       Uri.parse(url),
//       body: formData,
//     );

//     // Check if request is successful
//     if (response.statusCode == 200) {
//       // Check if response body is not null
//       if (response.body != null) {
//         // Parse response JSON
//         Map<String, dynamic> data = json.decode(response.body);

//         // Update state with user profile data
//         setState(() {
//           username = data['username'];
//           email = data['email'];
//           // Handle other user data as needed
//         });
//       } else {
//         // Handle null response body
//         print('Response body is null');
//       }
//     } else {
//       // If request fails, print error message
//       print('Request failed with status: ${response.statusCode}');
//     }
//   } catch (error) {
//     // Catch any errors that occur during the HTTP request
//     print('Error making HTTP request: $error');
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('User Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Username: $username',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Email: $email',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: getUserProfile,
//               child: Text('Get User Profile'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


    // for new model
    /*
import 'package:HumaraGhar/API/PropertyServices/propertyService.dart';
import 'package:HumaraGhar/view/test_screens/property%20testing/propertyListModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late Future<PropertyListModel> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = PropertyServics.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: FutureBuilder<PropertyListModel>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.data.length,
              itemBuilder: (context, index) {
                final property = snapshot.data!.data[index];
                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: property.propertyAttachments.isNotEmpty
                        ? property.propertyAttachments.first.url
                        : 'https://via.placeholder.com/150', // Placeholder image if no image is available
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(property.name),
                  subtitle: Text(property.price),
                  onTap: () {
                    // Handle tap
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
 */