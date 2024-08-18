
import 'dart:convert';

import 'package:HumaraGhar/model/banner_model.dart';
import 'package:HumaraGhar/API/latest_projects/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class LatestProjectServices{


  Future<LatestProjectModel> fetchLatestProjects()async{

  final response = await http.get(Uri.parse('https://cybernsoft.com/hg/latest_project.php'));
  try{
    if(response.statusCode == 200){
        return LatestProjectModel.fromJson(json.decode(response.body)); 
      }
      else{
        throw Exception('Failed to load Latest Projects');
        }
    }
  catch(e){
      print(e.toString());
      return throw Exception(e.toString()) ;
  }
    }
}

