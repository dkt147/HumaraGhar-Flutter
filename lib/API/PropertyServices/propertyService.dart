import 'dart:convert';

import 'package:HumaraGhar/API%20testing/Properties/getProperties/propertyListModel.dart';
import 'package:http/http.dart' as http ;

class PropertySer2vics{

  String baseUrl = 'https://cybernsoft.com/hg/';
  String  fetchList = 'project_list.php';
  String loginUrl= 'login.php';


  Future<PropertyListModel> fetchProducts() async {
    final response = await http.get(Uri.parse("https://cybernsoft.com/hg/project_list.php"));
    
    if (response.statusCode == 200) {
      return PropertyListModel.fromJson(json.decode(response.body));
    }
    
     else {
      throw Exception('Failed to load products');
    }
  }
}