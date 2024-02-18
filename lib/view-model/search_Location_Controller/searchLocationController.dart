
import 'package:HumaraGhar/List/list_of_cities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {

  final RxString selectedLocation = ''.obs;

  final RxList<String> cities = citiesList.obs;
  final RxList<String> filterCity = <String>[].obs;
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // cities.addAll([
    //   'Karachi',
    //   'Lahore',
    //   'Peshawar',
    //   'Islamabad',
    //   'Quetta',
    //   'Sakkar',
    //   'Hyderabad',
    //   'Rawalpindi',
    //   'Mansera',
    //   'Sargodha',
    //   'Nawabshah',
    //   'Faizabad',
    //   'Hunza',
    //   'Kashmir',
    // ]);

    filterCity.assignAll(cities);
  }

  void filterCities(String query) {
    if (query.isEmpty) {
      filterCity.assignAll(cities);
    } else {
      filterCity.assignAll(cities.where((element) => element.toLowerCase().contains(query.toLowerCase())));
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }


void setLocation(String newLocation){

  selectedLocation.value = newLocation;
  print(selectedLocation.value);
  searchController.clear();
}
}

