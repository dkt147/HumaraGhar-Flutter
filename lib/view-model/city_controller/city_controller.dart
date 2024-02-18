

import 'package:HumaraGhar/List/list_of_cities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CityController extends GetxController {
  final RxString selectedCity = 'Karachi'.obs;
 final RxList<String> cities = citiesList.obs;
 
      // Filtered list of cities based on user input

  final RxList<String> filterCity = <String>[].obs;

 final TextEditingController searchController = TextEditingController();
  
  
  
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    filterCity.assignAll(cities);
  }



  // Function to filter cities based on user input
  void filterCities(String query) {
    // If the query is empty, show all cities
    if (query.isEmpty) {
      filterCity.assignAll(cities);
    } else {
      // Filter cities based on the query
      filterCity.assignAll(cities.where((city) => city.toLowerCase().contains(query.toLowerCase())));
         
    
    }
  }


    
  void setSelectedCity(String city) {
    selectedCity.value = city;
  }


  void updateSelectedCity (String city){
    selectedCity.value = city;
    Get.back();
  }

  

}