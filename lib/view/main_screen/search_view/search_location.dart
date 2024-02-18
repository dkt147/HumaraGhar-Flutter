import 'package:HumaraGhar/utils/background_container.dart';
import 'package:HumaraGhar/view-model/search_Location_Controller/searchLocationController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SearchLocationScreen extends StatelessWidget {
  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BackgroundContainer(
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 172, 211, 206)),
          automaticallyImplyLeading: true,
          title: Text('Search Locations'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: height * .05,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: TextField(
                          onChanged: locationController.filterCities,
                          controller: locationController.searchController,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            isDense: true,
                            prefixIcon: Icon(Icons.search, color: Color.fromARGB(255, 52, 47, 47), size: 22),
                            hintText: 'Search Location',
                            hintStyle: TextStyle(color: Color.fromARGB(255, 89, 84, 84)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width * .02),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: height * .05,
                      width: width * .2,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Center(
                          child: Text('Map', style: TextStyle(color: Color.fromARGB(255, 52, 47, 47), fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * .02),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: locationController.filterCity.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          locationController.setLocation(locationController.filterCity[index]);
                          Get.back();
                        },
                        child: ListTile(
                          title: Text(locationController.filterCity[index]),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}