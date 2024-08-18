// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:HumaraGhar/API%20testing/Ads%20Api/get_nearby_location/service.dart';
// import 'package:HumaraGhar/utils/background_container.dart';

// class Location {
//   final int id;
//   final String name;

//   Location({required this.id, required this.name});
// }

// class Data {
//   final int id;
//   final String name;

//   Data({required this.id, required this.name});
// }

// class SearchLocationController extends GetxController {
//   final TextEditingController searchController = TextEditingController();
//   RxList<Location> locations = <Location>[].obs;
//   RxList<Location> filteredLocations = <Location>[].obs;
//   Rx<Location?> selectedLocation = Rx<Location?>();

//   @override
//   void onInit() {
//     super.onInit();
//     fetchLocations();
//   }

//  Future<void> fetchLocations() async {
//   try {
//     final locationList = await NearByLocationService().getNearByLocations();
//     locations.assignAll(locationList.map((data) => Location(id: data.id, name: data.name)));
//     filteredLocations.assignAll(locations);
//   } catch (e) {
//     print("Error fetching locations: $e");
//   }
// }

//   void filterLocations(String query) {
//     if (query.isEmpty) {
//       filteredLocations.assignAll(locations);
//     } else {
//       filteredLocations.assignAll(locations.where((location) => location.name!.toLowerCase().contains(query.toLowerCase())));
//     }
//   }

//   void setLocation(Location location) {
//     selectedLocation.value = location;
//     // Perform any other action needed when a location is selected
//     print("Selected Location: ${location.name}");
//   }
// }



// class City {
//   final String id;
//   final String name;

//   City({required this.id, required this.name});
// }

// class CityController extends GetxController {
//   final Rx<City> selectedCity = City(id: '1', name: 'Karachi').obs; // Initialize with default city
//   final RxList<City> cities = <City>[].obs;
//   final RxList<City> filterCity = <City>[].obs;
//   final TextEditingController searchController = TextEditingController();

//   @override
//   void onInit() {
//     super.onInit();
//     fetchCities();
//   }

//   Future<void> fetchCities() async {
//     try {
//       final cityList = await .getCities();
//       cities.assignAll(cityList.data!.map((city) => City(id: city.id!, name: city.name!)));
//       filterCity.assignAll(cities);
//     } catch (e) {
//       print("Error fetching cities: $e");
//     }
//   }

//   void filterCities(String query) {
//     if (query.isEmpty) {
//       filterCity.assignAll(cities);
//     } else {
//       filterCity.assignAll(cities.where((city) => city.name.toLowerCase().contains(query.toLowerCase())));
//     }
//   }

//   void updateSelectedCity(City city) {
//     selectedCity.value = city;
//     // Access the ID and Name of the selected city
//     print(city.id);
//     print("Selected City ID: ${city.id}, Name: ${city.name}");
//     Get.back();
//   }
// }
