import 'package:HumaraGhar/API/Ads%20Api/get_nearby_location/service.dart';
import 'package:HumaraGhar/constants/background_container.dart';
import 'package:HumaraGhar/view-model/search_Location_Controller/searchLocationController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SelectNearbyLocationScreen extends StatelessWidget {
  final NearByLocationController locationController = Get.put(NearByLocationController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BackgroundContainer(
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 172, 211, 206)),
          automaticallyImplyLeading: true,
          title: Text('Near By Locations'),
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
                          onChanged: locationController.filterNearByLocationList,
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
              
                ],
              ),
              SizedBox(height: height * .02),
              
              
                  // List of locations
                                  Expanded(
                                    flex: 1,
                                    child: Obx(
                                      ()=> ListView.builder(
                                        itemCount: locationController.filterNearbyList.length,
                                        itemBuilder: (context , index){
                                          final nearby = locationController.filterNearbyList[index];
                                          return InkWell(
                                            
                                            onTap: (){
                                              //  print('Hello');
                                               print('selected id ' + locationController.selectedNearByLocation.value.id);
                                              // cityController.updateSelectedCity(cityController.cities[index].toString());
                                              locationController.updateSelectedCity(nearby);
                                             
                                                  
                                            },

                                            child: ListTile(
                                            // title: Text(cityController.filterCity[index] , style: TextStyle(color: Colors.black),) ,
                                            title: Text(nearby.name , style: TextStyle(color: Colors.black),) ,
                                          ));
                                          
                                                                  
                                      }),
                                    ),
                                  ),
              
            
           
            ],
          ),
        ),
      ),
    );
  }
}