import 'dart:convert';
import 'package:HumaraGhar/API/property%20testing/Properties/getProperties/propertyListModel.dart';
import 'package:http/http.dart' as http;

class GetSinglePropertyServices {
  
Future<PropertyListModel> getSingleProperty(String propertyId) async {
    
    String url =  'https://cybernsoft.com/hg/get_single_project.php';
    final response = await http.post(
      // Uri.parse('https://cybernsoft.com/hg/project_list.php')
      Uri.parse(url),
      body:  {'property_id': propertyId}
      );
  try{
       if (response.statusCode == 200) {
      return PropertyListModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load property list');
    }
  }catch(e){
       print(e.toString());
      throw Exception(e.toString());
  }
   
  }

  // Future<SinglePropertyModel> getSingleProperty(String propertyId) async {
  //   // Your API endpoint URL
  //   String url = 'https://cybernsoft.com/hg/get_single_property.php0';

  //   try {
  //     // Make the POST request with property_id parameter
  //     final response = await http.post(
  //       Uri.parse(url),
  //       body: {'property_id': propertyId},
  //     );

  //     // Check the response status
  //     if (response.statusCode == 200) {
  //       // Request successful, parse the JSON response
  //       return SinglePropertyModel.fromJson(json.decode(response.body));
  //     } else {
  //       // Request failed
  //       throw Exception('Failed to get single property');
  //     }
  //   } catch (e) {
  //     // Error occurred during the request
  //     print(e.toString());
  //     throw Exception(e.toString());
  //   }
  // }
}



// class GetSinglePropertyServices {
//   Future<SinglePropertyModel> getSingleProperty(String propertyId) async {
//     // Your API endpoint URL
//     String url = 'https://cybernsoft.com/hg/get_single_project.php';

//     try {
//       // Make the POST request with property_id parameter
//       final response = await http.post(
//         Uri.parse(url),
//         body: {'property_id': propertyId},
//       );

//       // Check the response status
//       if (response.statusCode == 200) {
//         // Request successful, parse the JSON response
//         Map<String, dynamic> responseData = json.decode(response.body);
//         if (responseData['status'] == 1) {
//           // Response contains property data
//           return SinglePropertyModel.fromJson(responseData['data'][0]);
//         } else {
//           // Request successful, but property not found or other error
//           throw Exception(responseData['message']);
//         }
//       } else {
//         // Request failed
//         throw Exception('Failed to get single property');
//       }
//     } catch (e) {
//       // Error occurred during the request
//       print(e.toString());
//       throw Exception(e.toString());
//     }
//   }
// }

/* 
class GetSinglePropertyServices {
  Future<SinglePropertyModel> getSingleProperty(String propertyId) async {
    // Your API endpoint URL
    String url = 'https://cybernsoft.com/hg/get_single_property.php';

    try {
      // Make the POST request with property_id parameter
      final response = await http.post(
        Uri.parse(url),
        body: {'property_id': propertyId},
      );

      // Check if the response body is not null
      if (response.body != null) {
        // Check the response status
        if (response.statusCode == 200) {
          // Request successful, parse the JSON response
          Map<String, dynamic> responseData = json.decode(response.body);
          if (responseData['status'] == 1) {
            // Response contains property data
            return SinglePropertyModel.fromJson(responseData['data'][0]);
          } else {
            // Request successful, but property not found or other error
            throw Exception(responseData['message']);
          }
        } else {
          // Request failed
          throw Exception('Failed to get single property: ${response.statusCode}');
        }
      } else {
        // Response body is null
        throw Exception('Response body is null');
      }
    } catch (e) {
      // Error occurred during the request
      print(e.toString());
      throw Exception(e.toString());
    }
  }
}
*/

/* 
class GetSinglePropertyServices {
  Future<SinglePropertyModel> getSingleProperty(String propertyId) async {
    // Your API endpoint URL
    String url = 'https://cybernsoft.com/hg/get_single_property.php';

    try {
      // Make the POST request with property_id parameter
      final response = await http.post(
        Uri.parse(url),
        body: {'property_id': propertyId},
      );

      // Check the response status
      if (response.statusCode == 200) {
        // Request successful, parse the JSON response
        Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['status'] == 1) {
          // Response contains property data
          return SinglePropertyModel.fromJson(responseData['data'][0]);
        } else {
          // Request successful, but property not found or other error
          throw Exception(responseData['message']);
        }
      } else if (response.statusCode == 404) {
        // Property not found
        throw Exception('Property not found. Error code: ${response.statusCode}');
      } else {
        // Request failed with another status code
        throw Exception('Failed to get single property. Error code: ${response.statusCode}');
      }
    } catch (e) {
      // Error occurred during the request
      print(e.toString());
      throw Exception('Failed to get single property: $e');
    }
  }
}
*/