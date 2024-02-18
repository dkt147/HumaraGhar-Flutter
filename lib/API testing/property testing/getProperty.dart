import 'dart:convert';
import 'package:HumaraGhar/API%20testing/property%20testing/model.dart';
import 'package:http/http.dart' as http;


class FetchPropertyServices{
Future<List<Property>> fetchProperties() async {
  final response = await http.get(Uri.parse('https://cybernsoft.com/hg/project_list.php'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    if (jsonData['status'] == 1) {
      List<Property> properties = [];
      for (var item in jsonData['data']) {
        properties.add(Property.fromJson(item));
      }
      return properties;
    } else {
      throw Exception('API returned status ${jsonData['status']}: ${jsonData['message']}');
    }
  } else {
    throw Exception('Failed to load properties: ${response.statusCode}');
  }
}
}