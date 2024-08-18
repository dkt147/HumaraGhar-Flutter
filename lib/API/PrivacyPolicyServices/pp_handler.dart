
import 'package:HumaraGhar/model/privacy_policy_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class PrivacyPolicyService{


  
Future<PrivacyPolicyModel> privacyPolicyHandeler() async {

  var response =  await http.get(Uri.parse('https://cybernsoft.com/hg/about_us.php'));

   try{
      
  if(response.statusCode == 200){
    Map<String,dynamic> aboutusResponse = jsonDecode(response.body);
    return PrivacyPolicyModel.fromJson(aboutusResponse);
 

  }else{
    return throw 'Server Issue';
  }

    }catch(e){
      return throw 'Exception : ${e.toString()}';
    }

}

}
