import 'dart:convert';
import 'package:HumaraGhar/API/Ads%20Api/get_main_feature_list/main_feature_model.dart';
import 'package:HumaraGhar/API/Ads%20Api/get_nearby_location/nearby_location_model.dart';
import 'package:http/http.dart' as http;

class NearByLocationService{


Future<NearByLocationModel> getNearByLocations()async {

  try{

    var url = Uri.parse('https://cybernsoft.com/hg/ad/nearby_location_list.php') ;
    var response = await http.get(url) ;

    if(response.statusCode ==200){
        var jsonResponse = jsonDecode(response.body);
       
        return NearByLocationModel.fromJson(jsonResponse);


    }else{
      throw Exception('API returned Error ${response.statusCode} and ${response.reasonPhrase} ');
      // throw Exception('API returned status ${jsonResponse['status']}: ${jsonData['message']}');
    }
    
    


  }catch(e){
    return throw {'Excption caught : ${e.toString()}'};
  }

}

}