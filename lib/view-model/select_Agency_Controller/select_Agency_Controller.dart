
import 'package:HumaraGhar/List/list_of_agencies.dart';
import 'package:HumaraGhar/List/list_of_cities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectAgencyController extends GetxController {

  final RxString selectedAgency = ''.obs;

  final RxList<String> allAgencies = agencyList.obs;
  final RxList<String> filterAgency = <String>[].obs;
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    filterAgency.assignAll(allAgencies);
  }

  void filterAgencies(String query) {
    if (query.isEmpty) {
      filterAgency.assignAll(allAgencies);
    } else {
      filterAgency.assignAll(allAgencies.where((element) => element.toLowerCase().contains(query.toLowerCase())));
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }


void setAgency(String newAgency){

  selectedAgency.value = newAgency;
  print(selectedAgency.value);
  searchController.clear();
}
}

