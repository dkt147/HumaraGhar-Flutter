
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> getUserProfile() async {
  // API endpoint
  String url = 'https://cybernsoft.com/hg/get_user.php';

  // Form data
  Map<String, String> formData = {
    'id': '5',
  };

  try {
    // Make POST request
    http.Response response = await http.post(
      Uri.parse(url),
      body: formData,
    );

    // Check if request is successful
    if (response.statusCode == 200) {
      // Parse response JSON
      Map<String, dynamic> data = json.decode(response.body);

      // Handle user profile data
      // For example:
      String username = data['username'];
      String email = data['email'];
      // Handle other user data as needed
    } else {
      // If request fails, print error message
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (error) {
    // Catch any errors that occur during the HTTP request
    print('Error making HTTP request: $error');
  }
}