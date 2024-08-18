
import 'package:HumaraGhar/model/about_us_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class AboutUsService{


  
Future<AboutUsModel> aboutusHandeler() async {

  var response =  await http.get(Uri.parse('https://cybernsoft.com/hg/about_us.php'));

   try{
      
  if(response.statusCode == 200){
    Map<String,dynamic> aboutusResponse = jsonDecode(response.body);
    return AboutUsModel.fromJson(aboutusResponse);
 

  }else{
    return throw 'Server Issue';
  }

    }catch(e){
      return throw 'Exception : ${e.toString()}';
    }

}

}
