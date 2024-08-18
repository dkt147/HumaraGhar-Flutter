import 'dart:convert';

import 'package:HumaraGhar/API/AuthServices/send_OTP_model.dart';
import 'package:http/http.dart' as http;

class ForgetPasswordServices{


  Future<SendOtpModel> sendOTPtoEmail({String?
   email})async{
     var url = 'https://cybernsoft.com/hg/send_confirm_password_email.php';

    final response = await http.post(Uri.parse(url)  , body: {
      'email' : email
    });

    try{
      
    if(response.statusCode == 200){
      final jsonResponse = jsonDecode(response.body);
      return SendOtpModel.fromJson(jsonResponse[0]);
    }else{
      throw Exception('Falied to send Email');
    }
    }catch(e){
      throw Exception('Exception Occured :  ${e.toString()}');
    }
  }

}