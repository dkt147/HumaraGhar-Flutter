import 'dart:convert';
import 'package:http/http.dart' as http;

class PropertyService {
  final String baseUrl;

  PropertyService({required this.baseUrl});

  Future<Map<String, dynamic>> fetchPropertyData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        return jsonDecode(response.body);
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to load property data: ${response.statusCode}');
      }
    } catch (e) {
      // Catch any errors during the HTTP request
      throw Exception('Failed to load property data: $e');
    }
  }
}
