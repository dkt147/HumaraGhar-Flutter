// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:HumaraGhar/view-model/city_controller/city_controller.dart';

class AddCityBottomSheet extends StatelessWidget {
  
  const AddCityBottomSheet({
    Key? key,
    required this.citiesList,
    required this.height,
    required this.width,
  }) : super(key: key);

  final List citiesList;
  final double height;
  final double width;

  @override
  // List<String> filteredCities = [];
    
  Widget build(BuildContext context) {
  final cityController = Get.put(CityController());
    return Obx(
      ()=> InkWell(
                 onTap: (){
                          Get.bottomSheet(
                            
                            Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(12) , topRight: Radius.circular(12)),
                             color: Color.fromARGB(255, 172, 211, 206),
                            ),
                               height: height * 6,
                            width: width * 9,
                            child: Padding(
                              padding: const EdgeInsets.only(left : 12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 2,),
                                    // Horizontal bar
                                  Center(
                                    child: Container(
                                      width: width * .4,
                                      height: height * .01,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 72, 70, 70),
                                        borderRadius: BorderRadius.circular(20)
                                      ),
                                    ),
                                  ),
                                  // Bottom sheet  Content
                                  SizedBox(height: 12,),
                                  Center(child: Text('Select City' , style: GoogleFonts.robotoFlex(fontWeight: FontWeight.w600 , fontSize: 18),)),
                                  
                                  SizedBox(height: 12,),
                                  Row(
                                    children: [
                                  // Text Field
                  
                                    Container(
                                     height: height * .05,
                                     width: width * .9,
                                     decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(22)
                                        ),
                                      child: Padding(
                                     padding: const EdgeInsets.symmetric( horizontal : 3.0),
                                       child: TextField(
                                         controller:cityController.searchController,
                                         decoration: InputDecoration(
                                           focusedBorder: InputBorder.none,
                                           enabledBorder: InputBorder.none,
                                           isDense: true,
                                           prefixIcon: Icon(Icons.search , color:  Color.fromARGB(255, 52, 47, 47), size: 22,),
                                           hintText: 'Search City',
                                           hintStyle: TextStyle(color: Color.fromARGB(255, 89, 84, 84)),
                                 ),
                                         onChanged:  cityController.filterCities,
                                         
                                     ),
                                   )),
                                 ] ),
                                  SizedBox(height: height * .02,),
                                    // List of cities
                                  Expanded(
                                    flex: 1,
                                    child: Obx(
                                      ()=> ListView.builder(
                                        itemCount: cityController.filterCity.length,
                                        itemBuilder: (context , index){
                                          return InkWell(
                                            onTap: (){
                                              cityController.updateSelectedCity(cityController.cities[index].toString());
                                                  
                                            },

                                            child: ListTile(
                                            title: Text(cityController.filterCity[index] , style: TextStyle(color: Colors.black),) ,
                                          ));
                                          
                                                                  
                                      }),
                                    ),
                                  ),
                                
                                ],
                              ),
                            ),
                          ));
                        },
                        
              child: Container(
                 height: height * .08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [Padding(
                      padding: const EdgeInsets.symmetric(vertical : 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('City' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 16),),
                          Text(cityController.selectedCity.value , style: TextStyle(color: Color.fromARGB(255, 1, 78, 141) , fontSize: 18),)
                        ],
                      ),
                    )],
                  ),
                  Icon(Icons.arrow_forward_ios , color: Colors.white,)
                ],),
              ),
            ),
    );
  }

  // void searchCity(String query){
  //   final suggestions = citiesList.where((city) {
  //     final cityList =  ;
  //     final input = query.toLowerCase();

  //     return cityList.contains(input);
  //   }).toList();
  // }
}
