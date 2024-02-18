import 'dart:convert';
import 'package:HumaraGhar/API%20testing/Favorites/postFavoriteProperties/post_Favorite_model.dart';
import 'package:http/http.dart' as http;


                  
Future<void> postFavoriteProperty(FavoriteProperty favoriteProperty) async {
  final url = 'https://cybernsoft.com/hg/my_favourite_property.php';
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode(
{
  
});

  try {
    final response = await http.post(Uri.parse(url), headers: headers, body: body);
    if (response.statusCode == 200) {
      print('Favorite property added successfully!');
    } else {
      print('Failed to add favorite property. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}