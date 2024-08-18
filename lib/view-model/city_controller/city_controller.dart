

// // import 'package:HumaraGhar/List/list_of_cities.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';

// // class CityController extends GetxController {
// //   final RxString selectedCity = 'Karachi'.obs;
// //  final RxList<String> cities = citiesList.obs;
 
// //       // Filtered list of cities based on user input

// //   final RxList<String> filterCity = <String>[].obs;

// //  final TextEditingController searchController = TextEditingController();
  
  
  
// // @override
// //   void onInit() {
// //     // TODO: implement onInit
// //     super.onInit();
// //     filterCity.assignAll(cities);
// //   }



// //   // Function to filter cities based on user input
// //   void filterCities(String query) {
// //     // If the query is empty, show all cities
// //     if (query.isEmpty) {
// //       filterCity.assignAll(cities);
// //     } else {
// //       // Filter cities based on the query
// //       filterCity.assignAll(cities.where((city) => city.toLowerCase().contains(query.toLowerCase())));
         
    
// //     }
// //   }


    
// //   void setSelectedCity(String city) {
// //     selectedCity.value = city;
// //   }


// //   void updateSelectedCity (String city){
// //     selectedCity.value = city;
// //     Get.back();
// //   }

  

// // }



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:HumaraGhar/API%20testing/Ads%20Api/get_city_list/service.dart';

// class CityController extends GetxController {
//   final RxString selectedCity = 'Karachi'.obs;
//   final RxList<String> cities = <String>[].obs;
//   final RxList<String> filterCity = <String>[].obs;
//   final TextEditingController searchController = TextEditingController();

//   @override
//   void onInit() {
//     super.onInit();
//     fetchCities();
//   }

//   Future<void> fetchCities() async {
//     try {
//       final cityList = await CityListService().getCities();
//       cities.assignAll(cityList.data!.map((city) => city.id!));
//       filterCity.assignAll(cities);
//     } catch (e) {
//       print("Error fetching cities: $e");
//     }
//   }

//   void filterCities(String query) {
//     if (query.isEmpty) {
//       filterCity.assignAll(cities);
//     } else {
//       filterCity.assignAll(cities.where((city) => city.toLowerCase().contains(query.toLowerCase())));
//     }
//   }

//   void updateSelectedCity(String city) {
//     selectedCity.value = city;
//     Get.back();
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:HumaraGhar/API/Ads%20Api/get_city_list/service.dart';

class City {
  final String id;
  final String name;

  City({required this.id, required this.name});
}

class CityController extends GetxController {
  final Rx<City> selectedCity = City(id: '1', name: 'Karachi').obs; // Initialize with default city
  final RxList<City> cities = <City>[].obs;
  final RxList<City> filterCity = <City>[].obs;
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchCities();
  }

  Future<void> fetchCities() async {
    try {
      final cityList = await CityListService().getCities();
      cities.assignAll(cityList.data!.map((city) => City(id: city.id!, name: city.name!)));
      filterCity.assignAll(cities);
    } catch (e) {
      print("Error fetching cities: $e");
    }
  }

  void filterCities(String query) {
    if (query.isEmpty) {
      filterCity.assignAll(cities);
    } else {
      filterCity.assignAll(cities.where((city) => city.name.toLowerCase().contains(query.toLowerCase())));
    }
  }

  void updateSelectedCity(City city) {
    selectedCity.value = city;
    // Access the ID and Name of the selected city
    print(city.id);
    print("Selected City ID: ${city.id}, Name: ${city.name}");
    Get.back();
  }
}
