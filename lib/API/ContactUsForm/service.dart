

import 'dart:convert';
import 'package:HumaraGhar/model/contactus_form_model.dart';
import 'package:HumaraGhar/model/news_model.dart';
import 'package:http/http.dart' as http;

class ContactUsService {
  Future<ContactResponse> submitContactForm( String name , String email,String phone, String subject , String message) async {
    final url = Uri.parse('https://cybernsoft.com/hg/contact_us.php');
     Map<String ,dynamic> body ={
        'name' : name,
        'email' : email,
        'phone' : phone, 
        'subject' : subject,
        'message' : message
     };
     var response =await http.post(
      url, 
      body: body);
    try {
      if (response.statusCode == 200) {
        
        
        final jsonData = json.decode(response.body);
        //  var a = ContactUsModel.fromJson(jsonData[0]['status']);
        var contactRsponse = ContactResponse.fromJson(jsonData[0]);
        // print(a);
        return contactRsponse;
      } else {
        throw Exception('Failed to submit form. Status Code : ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to submit contact form ${e.toString()}');
    }
  }
}

/* 
import 'dart:convert';
import 'package:HumaraGhar/API%20testing/ContactUsForm/model.dart';
import 'package:http/http.dart' as http;

class ContactUsService {
  Future<ContactResponse> submitContactForm({
    required String name,
    required String email,
    required String phone,
    required String subject,
    required String message,
  }) async {
    final url = Uri.parse('https://cybernsoft.com/hg/contact_us.php');
    final response = await http.post(
      url,
      body: {
        'name': name,
        'email': email,
        'phone': phone,
        'subject': subject,
        'message': message,
      },
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return ContactResponse.fromJson(responseData[0]);
    } else {
      throw Exception('Failed to submit contact form');
    }
  }
}
*/