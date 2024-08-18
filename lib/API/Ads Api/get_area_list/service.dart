import 'dart:convert';

import 'package:HumaraGhar/API/Ads%20Api/get_area_list/area_model.dart';
import 'package:http/http.dart' as http;

class AreaListService{


Future<AreaListModel> getAreaSizeList()async {

  try{

    var url = Uri.parse('https://cybernsoft.com/hg/ad/area_list.php') ;
    var response = await http.get(url) ;

    if(response.statusCode ==200){
        var jsonResponse = jsonDecode(response.body);
       
        // if(response['status'] == 1){

        // }

        return AreaListModel.fromJson(jsonResponse);


    }else{
      throw Exception('API returned Error ${response.statusCode} and ${response.reasonPhrase} ');
      // throw Exception('API returned status ${jsonResponse['status']}: ${jsonData['message']}');
    }
    
    


  }catch(e){
    return throw {'Excption caught : ${e.toString()}'};
  }

}

}