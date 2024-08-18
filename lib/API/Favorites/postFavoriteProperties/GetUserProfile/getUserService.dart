

import 'dart:convert';

import 'package:HumaraGhar/API/Favorites/postFavoriteProperties/GetUserProfile/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class UserProfileService{
Future<GetUserProfileModel> getUserProfile(String userID)async{
try{
  final response = await http.post(Uri.parse('https://cybernsoft.com/hg/get_user.php') ,body: {
    "id" : userID
  } );
  if(response.statusCode == 200){
    Map<String, dynamic> responseData = jsonDecode(response.body);
    return GetUserProfileModel.fromJson(responseData);
  }else{
    return throw('Not able to load profile');
  }

}catch(e){
  return throw Exception(e.toString());
}

}
}