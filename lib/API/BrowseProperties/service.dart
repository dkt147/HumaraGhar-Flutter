
import 'dart:convert';
import 'package:HumaraGhar/API/BrowseProperties/model.dart';
import 'package:http/http.dart' as http;
class BrowsePropertyServices{


  Future<BrowsePropertyModel> browseProperty()async{

  final response = await http.get(Uri.parse('https://cybernsoft.com/hg/browse_property.php'));
  try{
    if(response.statusCode == 200){
        return BrowsePropertyModel.fromJson(json.decode(response.body)); 
      }
      else{
        throw Exception('Failed to browse property');
        }
    }
  catch(e){
      print(e.toString());
      return throw Exception(e.toString()) ;
  }
    }
}

