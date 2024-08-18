
import 'dart:convert';

import 'package:HumaraGhar/model/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomeServices{


  Future<BannerModel> fetchBannerImages()async{

  final response = await http.get(Uri.parse('https://cybernsoft.com/hg/banner_images.php'));
  try{
    if(response.statusCode == 200){
        return BannerModel.fromJson(json.decode(response.body)); 
      }
      else{
        throw Exception('Failed to load Banner Images');
        }
    }
  catch(e){
      print(e.toString());
      return throw Exception(e.toString()) ;
  }
    }
}

