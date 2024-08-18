import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;


class PostAdResponse {
  final int status;
  final String message;

  PostAdResponse({required this.status, required this.message});

  factory PostAdResponse.fromJson(Map<String, dynamic> json) {
    return PostAdResponse(
      status: json['status'],
      message: json['message'],
    );
  }
}

class PostAdService {
  final String apiUrl = 'https://cybernsoft.com/hg/ad/post_an_ad.php';

Future<PostAdResponse> postAd({
  required String name,
  required String price,
  required String agencyId,
  required String propertyAreaId,
  required String propertyCategoryId,
  required String propertyLocationId,
  required String propertyDeveloperId,
  required String propertyHouseTypeId,
  required String propertyTypeId,
  required String isSold,
  required String createdBy,
  required String propertyCity,
  required List<File> propertyAttachments,
  required List<String> featuresSubType,
  required String propertyNearbyLocations,
  required String noOfBedrooms,
  required String noOfBathrooms,
  required String contact,
}) async {
  // Create multipart request
  var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

  // Add text fields
  request.fields['name'] = name;
  request.fields['price'] = price;
  request.fields['agency_id'] = agencyId;
  request.fields['property_area_id'] = propertyAreaId;
  request.fields['property_category_id'] = propertyCategoryId;
  request.fields['property_location_id'] = propertyLocationId;
  request.fields['property_developer_id'] = propertyDeveloperId;
  request.fields['property_house_type_id'] = propertyHouseTypeId;
  request.fields['property_type_id'] = propertyTypeId;
  request.fields['is_sold'] = isSold;
  request.fields['created_by'] = createdBy;
  request.fields['property_city'] = propertyCity;
  request.fields['features_sub_type[]'] = jsonEncode(featuresSubType);
  request.fields['property_nearby_locations'] = propertyNearbyLocations;
  request.fields['no_of_bedrooms'] = noOfBedrooms;
  request.fields['no_of_bathrooms'] = noOfBathrooms;
  request.fields['contact'] = contact;

  // Add image files
  for (var i = 0; i < propertyAttachments.length; i++) {
    var file = propertyAttachments[i];
    request.files.add(
      await http.MultipartFile.fromPath('property_attachments[]', file.path),
    );
  }

  // Send request
  try {
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return PostAdResponse.fromJson(responseData);
    } else {
      throw Exception('Failed to post ad: ${response.reasonPhrase}');
    }
  } catch (e) {
    throw Exception('Failed to post ad: $e');
  }
}
}