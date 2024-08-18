
import 'dart:convert';
import 'package:HumaraGhar/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsServices {
  Future<NewsModel> fetchNews() async {
    final response = await http.get(Uri.parse('https://cybernsoft.com/hg/news.php'));
    try {
      if (response.statusCode == 200) {
        return NewsModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load News');
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }
}
