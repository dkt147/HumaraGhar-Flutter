
import 'package:HumaraGhar/API/Ads%20Api/get_property/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NearbyLocaton{
  final String name;
  final String id;

  NearbyLocaton({required this.id ,required this.name  });
}

class NearByLocationController extends GetxController {

  final Rx<NearbyLocaton> selectedNearByLocation = NearbyLocaton(id: '1', name: 'school').obs;

  final RxList<NearbyLocaton> nearbyLocations = <NearbyLocaton>[].obs;
  final RxList<NearbyLocaton> filterNearbyList = <NearbyLocaton>[].obs;
  final TextEditingController searchController = TextEditingController();




  @override
  void onInit() {
    super.onInit();
  
fetchNeatbyLcoations();
    // filterCity.assignAll(cities);
  }

    Future<void> fetchNeatbyLcoations() async {
    try {
      final nearbyService = await NearByLocationService().getNearByLocations() ;
      nearbyLocations.assignAll(nearbyService.data!.map((nearbyLocation) => NearbyLocaton(id: nearbyLocation.id!, name: nearbyLocation.name!)));
      filterNearbyList.assignAll(nearbyLocations);
    } catch (e) {
      print("Error fetching Nearby Location $e");
    }
  }


  void filterNearByLocationList(String query) {
    if (query.isEmpty) {
      filterNearbyList.assignAll(nearbyLocations);
    } else {
      filterNearbyList.assignAll(nearbyLocations.where((nearby) => nearby.name!.toLowerCase().contains(query.toLowerCase())));
    }
  }

  void updateSelectedCity(NearbyLocaton nearbyLocaton) {
    selectedNearByLocation.value = nearbyLocaton;
    // Access the ID and Name of the selected city
    print(nearbyLocaton.id);
    print("Selected Nearby Location ID: ${nearbyLocaton.id}, Name: ${nearbyLocaton.name}");
    Get.back();
  }
}



