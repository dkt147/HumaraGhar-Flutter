import 'dart:convert';
import 'package:HumaraGhar/API/Ads%20Api/get_city_list/city_list_model.dart';
import 'package:http/http.dart' as http;

class CityListService{


Future<CityListModel> getCities()async {

  try{

    var url = Uri.parse('https://cybernsoft.com/hg/ad/city_list.php') ;
    var response = await http.get(url) ;

    if(response.statusCode ==200){
        var jsonResponse = jsonDecode(response.body);
       
        return CityListModel.fromJson(jsonResponse);


    }else{
      throw Exception('API returned Error ${response.statusCode} and ${response.reasonPhrase} ');
      // throw Exception('API returned status ${jsonResponse['status']}: ${jsonData['message']}');
    }
    
    


  }catch(e){
    return throw {'Excption caught : ${e.toString()}'};
  }

}

}