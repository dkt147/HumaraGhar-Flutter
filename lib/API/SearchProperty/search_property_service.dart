import 'dart:convert';
import 'package:HumaraGhar/API/property%20testing/Properties/getProperties/propertyListModel.dart';
import 'package:http/http.dart' as http;


class SearchPropertyService {
  static const String _baseUrl = 'https://cybernsoft.com/hg/search_property.php';

  static Future<PropertyListModel> searchProperties({
    String? cityId,
    // String? locationId,
    String? priceMin,
    String? priceMax,
    String? areaMin,
    String? areaMax,
    // String? agencyId,
  }) async {
    final Uri uri = Uri.parse(_baseUrl);
    final Map<String, dynamic> body = {
      'city_id': cityId ?? '',
      // 'location_id': locationId ?? '',
      'price_min': priceMin ?? '',
      'price_max': priceMax ?? '',
      'area_min': areaMin ?? '',
      'area_max': areaMax ?? '',
      // 'agency_id': agencyId ?? '0',
    };

    final response = await http.post(
      uri,
      body: body,
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData['status'] == 1) {
        // final List<dynamic> propertiesJson = jsonData['data'];
        return PropertyListModel.fromJson(jsonData);
      } else {
        throw Exception(jsonData['message']);
      }
    } else {
      throw Exception('Failed to load properties: ${response.statusCode}');
    }
  }
}

