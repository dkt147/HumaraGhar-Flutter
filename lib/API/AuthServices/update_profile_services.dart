
import 'dart:convert';
import 'package:HumaraGhar/API/AuthServices/update_profile_model.dart';
import 'package:http/http.dart' as http;

class UpdateProfileServices{


  Future<UpdateProfileModel> updateProfile({ String? user_id ,String? name , String? phone ,String?
   email , String? password })async{
     var url = 'https://cybernsoft.com/hg/update_profile.php';

    final response = await http.post(Uri.parse(url)  , body: {
      'user_id' : user_id,
      'name' : name,
      'phone' : phone,
      'email' : email,
      'password' : password
    });

    try{
      
    if(response.statusCode == 200){
      final jsonResponse = jsonDecode(response.body);
      return UpdateProfileModel.fromJson(jsonResponse);
    }else{
      throw Exception('Falied to send Email');
    }
    }catch(e){
      throw Exception('Exception Occured :  ${e.toString()}');
    }
  }

}