import 'dart:convert';
import 'package:HumaraGhar/API%20testing/Favorites/getFavoriteProperties/get_favorite_model.dart';
import 'package:http/http.dart' as http;



Future<List<GetFavoriteProperty>> fetchFavoriteProperties(String userID) async {
  final response = await 
  http.post(Uri.parse('https://cybernsoft.com/hg/my_favourite_property.php' , ),
   body : {
    'user_id' : userID
   },
   
  );
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    
    if (data.isNotEmpty && data[0]['status'] == 1) {
      print('Success');
      print(data[0]['data']);
      List<GetFavoriteProperty> favoriteProperties = [];
     
      for (var item in data[0]['response']) {
        favoriteProperties.add(GetFavoriteProperty.fromJson(item));
      }
      return favoriteProperties;
    } else {
      throw Exception('Failed to load favorite properties: ${data[0]['message']}');
    }
  } else {
    throw Exception('Failed to load favorite properties');
  }
}


