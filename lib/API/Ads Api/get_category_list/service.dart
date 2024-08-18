import 'dart:convert';

import 'package:HumaraGhar/API/Ads%20Api/get_category_list/category_model.dart';
import 'package:http/http.dart' as http;

class PropertyAdsCategoryService{


Future<PropertyAdsCategoryModel> getCategories()async {

  try{

    var url = Uri.parse('https://cybernsoft.com/hg/ad/category_list.php') ;
    var response = await http.get(url) ;

    if(response.statusCode ==200){
        var jsonResponse = jsonDecode(response.body);
       
        // if(response['status'] == 1){

        // }

        return PropertyAdsCategoryModel.fromJson(jsonResponse);


    }else{
      throw Exception('API returned Error ${response.statusCode} and ${response.reasonPhrase} ');
      // throw Exception('API returned status ${jsonResponse['status']}: ${jsonData['message']}');
    }
    
    


  }catch(e){
    return throw {'Excption caught : ${e.toString()}'};
  }

}

}