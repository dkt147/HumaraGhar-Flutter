import 'dart:convert';
import 'package:HumaraGhar/API/Favorites/getFavoriteProperties/get_favorite_model.dart';
import 'package:http/http.dart' as http;


class FavoriteService{
Future<List<FavoritePropertiesModel>> fetchFavoriteProperties(String userID) async {
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
      List<FavoritePropertiesModel> favoriteProperties = [];
     
      for (var item in data[0]['response']) {
        favoriteProperties.add(FavoritePropertiesModel.fromJson(item));
      }
      return favoriteProperties;
    } else {
      throw Exception('Failed to load favorite properties: ${data[0]['message']}');
    }
  } else {
    throw Exception('Failed to load favorite properties');
  }
}

Future<FavoritePropertiesModel> fetchMyFavProperties(String userID)async{

  final response = await http.post(
    Uri.parse('https://cybernsoft.com/hg/my_favourite_property.php'),
    body: {
      'user_id' : userID
    });
  try{
    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return FavoritePropertiesModel.fromJson(responseData);
      } catch (e) {
        throw Exception('Failed to parse response data: $e');
      }
    } else {
      throw Exception('Failed to fetch favorite properties: ${response.reasonPhrase}');
    }
  
  }catch(e){
    throw Exception(e.toString());
  }
}
}