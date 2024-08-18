// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class AdsCategoryController extends GetxController {
//   RxList<Map<String, String>> homeTabChoices = <Map<String, String>>[].obs;
//   RxList<Map<String, String>> plotTabChoices = <Map<String, String>>[].obs;
//   RxList<Map<String, String>> commercialTabChoices = <Map<String, String>>[].obs;

//     RxInt selectedHomeChoiceIndex = RxInt(-1);
//     RxInt selectedPlotChoiceIndex = RxInt(-1);
//     RxInt selectedCommercialChoiceIndex = RxInt(-1);


//   Future<void> fetchHomeTabChoices() async {
//     try {
//       var url = Uri.parse('https://cybernsoft.com/hg/ad/category_list.php');
//       var response = await http.get(url);

//       if (response.statusCode == 200) {
//         var jsonResponse = jsonDecode(response.body);
//         var homeCategories = jsonResponse['data']['House'] as List;
//         homeTabChoices.assignAll(homeCategories.map((category) => {
//               'property_category_id': category['property_category_id'].toString(),
//               'id': category['id'].toString(),
//               'name': category['name'].toString(),
//             }));
//       } else {
//         throw Exception('API returned Error ${response.statusCode} and ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       throw Exception('Exception caught: $e');
//     }
//   }

//   // RxInt selectedHomeChoiceIndex = RxInt(-1);

//   void handleHomeChipSelection(int index) {
//     if (selectedHomeChoiceIndex.value == index) {
//       selectedHomeChoiceIndex.value = -1;
//     } else {
//       selectedHomeChoiceIndex.value = index;
//     }

//     String? selectedHomeTabValue = selectedHomeChoiceIndex.value != -1 ? homeTabChoices[selectedHomeChoiceIndex.value]['name'] : '';


//     print('Selected Home Tab value: $selectedHomeTabValue');
//     print('Selected Home  Property Category ID: ${homeTabChoices[index]['property_category_id']}');
//     print('Selected Home Tab ID: ${homeTabChoices[index]['id']}');
//   }

//       // Plots Tab Container
//         Future<void> fetchPlotTabChoices() async {
//     try {
//       var url = Uri.parse('https://cybernsoft.com/hg/ad/category_list.php');
//       var response = await http.get(url);

//       if (response.statusCode == 200) {
//         var jsonResponse = jsonDecode(response.body);
//         var homeCategories = jsonResponse['data']['Plot'] as List;
//         plotTabChoices.assignAll(homeCategories.map((category) => {
//               'property_category_id': category['property_category_id'].toString(),
//               'id': category['id'].toString(),
//               'name': category['name'].toString(),
//             }));
//       } else {
//         throw Exception('API returned Error ${response.statusCode} and ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       throw Exception('Exception caught: $e');
//     }
//   }

//   // RxInt selectedHomeChoiceIndex = RxInt(-1);

//   void handlePlotChipSelection(int index) {
//     if (selectedPlotChoiceIndex.value == index) {
//       selectedPlotChoiceIndex.value = -1;
//     } else {
//       selectedPlotChoiceIndex.value = index;
//     }

//     String? selectedPlotTabValue = selectedPlotChoiceIndex.value != -1 ? plotTabChoices[selectedPlotChoiceIndex.value]['name'] : '';


//     print('Selected Plot Tab value: $selectedPlotTabValue');
//     print('Selected Plot  Property Category ID: ${plotTabChoices[index]['property_category_id']}');
//     print('Selected Plot Tab ID: ${plotTabChoices[index]['id']}');
//   }
//       // Commercial Tab Container


//    Future<void> fetchCommercialTabChoices() async {
//     try {
//       var url = Uri.parse('https://cybernsoft.com/hg/ad/category_list.php');
//       var response = await http.get(url);

//       if (response.statusCode == 200) {
//         var jsonResponse = jsonDecode(response.body);
//         var homeCategories = jsonResponse['data']['Commercial'] as List;
//         commercialTabChoices.assignAll(homeCategories.map((category) => {
//               'property_category_id': category['property_category_id'].toString(),
//               'id': category['id'].toString(),
//               'name': category['name'].toString(),
//             }));
//       } else {
//         throw Exception('API returned Error ${response.statusCode} and ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       throw Exception('Exception caught: $e');
//     }
//   }

//   // RxInt selectedHomeChoiceIndex = RxInt(-1);

//   void handleCommercialChipSelection(int index) {
//     if (selectedCommercialChoiceIndex.value == index) {
//       selectedCommercialChoiceIndex.value = -1;
//     } else {
//       selectedCommercialChoiceIndex.value = index;
//     }

//     String? selectedCommercialTabValue = selectedCommercialChoiceIndex.value != -1 ? commercialTabChoices[selectedCommercialChoiceIndex.value]['name'] : '';


//     print('Selected Commercial Tab value: $selectedCommercialTabValue');
//     print('Selected Commercial Tab Property Category ID: ${commercialTabChoices[index]['property_category_id']}');
//     print('Selected Commercial Tab ID: ${commercialTabChoices[index]['id']}');
//   }
    


// }

import 'dart:convert';

import 'package:HumaraGhar/view-model/Ad_Controller/ad_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class AdsCategoryController extends GetxController {
  RxList<Map<String, String>> homeTabChoices = <Map<String, String>>[].obs;
  RxList<Map<String, String>> plotTabChoices = <Map<String, String>>[].obs;
  RxList<Map<String, String>> commercialTabChoices = <Map<String, String>>[].obs;

  RxInt selectedHomeChoiceIndex = RxInt(-1);
  RxInt selectedPlotChoiceIndex = RxInt(-1);
  RxInt selectedCommercialChoiceIndex = RxInt(-1);

      // Global variable to select values
  String? selectedPropertyId;
  String? selectedId;
  String? selectedName;


  Future<void> fetchTabChoices(String category) async {
    try {
      var url = Uri.parse('https://cybernsoft.com/hg/ad/category_list.php');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var categories = jsonResponse['data'][category] as List;
        if (category == 'House') {
          homeTabChoices.assignAll(categories.map((category) => {
                'property_category_id': category['property_category_id'].toString(),
                'id': category['id'].toString(),
                'name': category['name'].toString(),
              }));
        } else if (category == 'Plot') {
          plotTabChoices.assignAll(categories.map((category) => {
                'property_category_id': category['property_category_id'].toString(),
                'id': category['id'].toString(),
                'name': category['name'].toString(),
              }));
        } else if (category == 'Commercial') {
          commercialTabChoices.assignAll(categories.map((category) => {
                'property_category_id': category['property_category_id'].toString(),
                'id': category['id'].toString(),
                'name': category['name'].toString(),
              }));
        }
      } else {
        throw Exception('API returned Error ${response.statusCode} and ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Exception caught: $e');
    }
  }

  // void handleHomeChipSelection(int index) {
  //   if (selectedHomeChoiceIndex.value == index) {
  //     selectedHomeChoiceIndex.value = -1;
  //   } else {
  //     selectedHomeChoiceIndex.value = index;
  //   }

  //   String? selectedHomeTabValue = selectedHomeChoiceIndex.value != -1 ? homeTabChoices[selectedHomeChoiceIndex.value]['name'] : '';

  //   print('Selected Home Tab value: $selectedHomeTabValue');
  //   print('Selected Home  Property Category ID: ${homeTabChoices[index]['property_category_id']}');
  //   print('Selected Home Tab ID: ${homeTabChoices[index]['id']}');
  // }

  // void handlePlotChipSelection(int index) {
  //   if (selectedPlotChoiceIndex.value == index) {
  //     selectedPlotChoiceIndex.value = -1;
  //   } else {
  //     selectedPlotChoiceIndex.value = index;
  //   }

  //   String? selectedPlotTabValue = selectedPlotChoiceIndex.value != -1 ? plotTabChoices[selectedPlotChoiceIndex.value]['name'] : '';

  //   print('Selected Plot Tab value: $selectedPlotTabValue');
  //   print('Selected Plot  Property Category ID: ${plotTabChoices[index]['property_category_id']}');
  //   print('Selected Plot Tab ID: ${plotTabChoices[index]['id']}');
  // }

  // void handleCommercialChipSelection(int index) {
  //   if (selectedCommercialChoiceIndex.value == index) {
  //     selectedCommercialChoiceIndex.value = -1;
  //   } else {
  //     selectedCommercialChoiceIndex.value = index;
  //   }

  //   String? selectedCommercialTabValue =
  //       selectedCommercialChoiceIndex.value != -1 ? commercialTabChoices[selectedCommercialChoiceIndex.value]['name'] : '';

  //   print('Selected Commercial Tab value: $selectedCommercialTabValue');
  //   print('Selected Commercial Tab Property Category ID: ${commercialTabChoices[index]['property_category_id']}');
  //   print('Selected Commercial Tab ID: ${commercialTabChoices[index]['id']}');
  // }




  void handleHomeChipSelection(int index) {
    if (selectedHomeChoiceIndex.value == index) {
      selectedHomeChoiceIndex.value = -1;
      selectedPropertyId = null;
      selectedId = null;
      selectedName = null;
    } else {
      selectedHomeChoiceIndex.value = index;
      selectedPlotChoiceIndex.value = -1; // Unselect plot tab
      selectedCommercialChoiceIndex.value = -1; // Unselect commercial tab
      // Update selected values
      selectedPropertyId = homeTabChoices[index]['property_category_id'];
      selectedId = homeTabChoices[index]['id'];
      selectedName = homeTabChoices[index]['name'];
    }
    print(selectedId);
    print(selectedName);
    print(selectedPropertyId);
  }

  void handlePlotChipSelection(int index) {
    if (selectedPlotChoiceIndex.value == index) {
      selectedPlotChoiceIndex.value = -1;
      selectedPropertyId = null;
      selectedId = null;
      selectedName = null;
    } else {
      selectedPlotChoiceIndex.value = index;
      selectedHomeChoiceIndex.value = -1; // Unselect home tab
      selectedCommercialChoiceIndex.value = -1; // Unselect commercial tab
      // Update selected values
      selectedPropertyId = plotTabChoices[index]['property_category_id'];
      selectedId = plotTabChoices[index]['id'];
      selectedName = plotTabChoices[index]['name'];
    }print(selectedId);
    print(selectedName);
    print(selectedPropertyId);

  }

  void handleCommercialChipSelection(int index) {
    if (selectedCommercialChoiceIndex.value == index) {
      selectedCommercialChoiceIndex.value = -1;
      selectedPropertyId = null;
      selectedId = null;
      selectedName = null;
    } else {
      selectedCommercialChoiceIndex.value = index;
      selectedHomeChoiceIndex.value = -1; // Unselect home tab
      selectedPlotChoiceIndex.value = -1; // Unselect plot tab
      // Update selected values
      selectedPropertyId = commercialTabChoices[index]['property_category_id'];
      selectedId = commercialTabChoices[index]['id'];
      selectedName = commercialTabChoices[index]['name'];
    }
    print(selectedId);
    print(selectedName);
    print(selectedPropertyId);
  }
}

    // Home Tabs
class HomeTabChoiceChips extends StatelessWidget {
    final selectedColor =  Color.fromARGB(255, 126, 213, 130);

  final backgroundColor =  Colors.blue.shade300;
 Color labelColor =  Colors.black;
  @override
  Widget build(BuildContext context) {
    AdsCategoryController adController = Get.put(AdsCategoryController());

    return FutureBuilder(
      // future: adController.fetchHomeTabChoices(),
      future: adController.fetchTabChoices('House'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error fetching data');
        } else {
          return Wrap(
            spacing: 8,
            runSpacing: 12,
            children:  List.generate(
                  adController.homeTabChoices.length,
                  (index) => Obx(
                    ()=> ChoiceChip(
                    showCheckmark: false,
                    selectedColor: selectedColor,
                    side: BorderSide.none,
                    labelStyle: TextStyle(color: labelColor),
                    backgroundColor: backgroundColor ,
                    shape: StadiumBorder(side: BorderSide(  style: BorderStyle.solid, color: const Color.fromARGB(255, 11, 78, 13) , strokeAlign: BorderSide.strokeAlignOutside ,width: 1000.0 )),
                
                      label: Text(adController.homeTabChoices[index]['name']!),
                      selected: adController.selectedHomeChoiceIndex == index,
                      onSelected: (bool selected) {
                        adController.handleHomeChipSelection(index);
                      },
                    ),
                  ),
                ),
          );
        }
      },
    );
  }
}


    // Plot Tabs
class PlotTabChoiceChips extends StatelessWidget {
    final selectedColor =  Color.fromARGB(255, 126, 213, 130);

  final backgroundColor =  Colors.blue.shade300;
 Color labelColor =  Colors.black;
  @override
  Widget build(BuildContext context) {
    AdsCategoryController adController = Get.put(AdsCategoryController());

    return FutureBuilder(
      // future: adController.fetchCommercialTabChoices(),
      
      future: adController.fetchTabChoices('Plot'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error fetching data');
        } else {
          return Wrap(
            spacing: 8,
            runSpacing: 12,
            children:  List.generate(
                  adController.plotTabChoices.length,
                  (index) => Obx(
                    ()=> ChoiceChip(
                    showCheckmark: false,
                    selectedColor: selectedColor,
                    side: BorderSide.none,
                    labelStyle: TextStyle(color: labelColor),
                    backgroundColor: backgroundColor ,
                    shape: StadiumBorder(side: BorderSide(  style: BorderStyle.solid, color: const Color.fromARGB(255, 11, 78, 13) , strokeAlign: BorderSide.strokeAlignOutside ,width: 1000.0 )),
                
                      label: Text(adController.plotTabChoices[index]['name']!),
                      selected: adController.selectedPlotChoiceIndex == index,
                      onSelected: (bool selected) {
                        adController.handlePlotChipSelection(index);
                      },
                    ),
                  ),
                ),
          );
        }
      },
    );
  }
}



    // Commercial Tabs
class CommercialTabChoiceChips extends StatelessWidget {
    final selectedColor =  Color.fromARGB(255, 126, 213, 130);

  final backgroundColor =  Colors.blue.shade300;
 Color labelColor =  Colors.black;
  @override
  Widget build(BuildContext context) {
    AdsCategoryController adController = Get.put(AdsCategoryController());

    return FutureBuilder(
      // future: adController.fetchCommercialTabChoices(),
      
      future: adController.fetchTabChoices('Commercial'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error fetching data');
        } else {
          return Wrap(
            spacing: 8,
            runSpacing: 12,
            children:  List.generate(
                  adController.commercialTabChoices.length,
                  (index) => Obx(
                    ()=> ChoiceChip(
                    showCheckmark: false,
                    selectedColor: selectedColor,
                    side: BorderSide.none,
                    labelStyle: TextStyle(color: labelColor),
                    backgroundColor: backgroundColor ,
                    shape: StadiumBorder(side: BorderSide(  style: BorderStyle.solid, color: const Color.fromARGB(255, 11, 78, 13) , strokeAlign: BorderSide.strokeAlignOutside ,width: 1000.0 )),
                
                      label: Text(adController.commercialTabChoices[index]['name']!),
                      selected: adController.selectedCommercialChoiceIndex == index,
                      onSelected: (bool selected) {
                        adController.handleCommercialChipSelection(index);
                      },
                    ),
                  ),
                ),
          );
        }
      },
    );
  }
}


// class HomeTab extends StatefulWidget  {
//   const HomeTab({super.key});

//   @override
//   State<HomeTab> createState() => _HomeTabState();
// }

// class _HomeTabState extends State<HomeTab> with TickerProviderStateMixin  {
//   @override
//   Widget build(BuildContext context) {
//     late TabController tabController = TabController(length: 3, vsync: this);
//      double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     AdsCategoryController adController = Get.put(AdsCategoryController());
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
        
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//                Text(
//                   'Select Property Type',
//                   style:
//                       GoogleFonts.robotoFlex(color: Colors.white, fontSize: 22),
//                 ),
//                 SizedBox(
//                   height: 14,
//                 ),

//                 // Tabs
//                 Container(
//                   width: width * .8,
//                   child: TabBar(
//                       // indicatorSize: TabBarIndicatorSize.label,
//                       labelColor: Color.fromARGB(255, 20, 59, 89),
//                       isScrollable: true,
//                       // indicatorColor: Color.fromARGB(255, 20, 59, 89),
//                       indicatorColor: Colors.green,
//                       dividerColor: Color.fromARGB(0, 35, 112, 119),
//                       controller: tabController,
//                       tabs: [
//                         Text(
//                           'Homes',
//                           style: GoogleFonts.roboto(
//                               fontSize: 14, fontWeight: FontWeight.w500),
//                         ),
//                         Text(
//                           'Plots',
//                           style: GoogleFonts.roboto(
//                               fontSize: 14, fontWeight: FontWeight.w500),
//                         ),
//                         Text(
//                           'Commercial',
//                           style: GoogleFonts.roboto(
//                               fontSize: 14, fontWeight: FontWeight.w500),
//                         ),
//                       ]),
//                 ),
//                 SizedBox(
//                   height: 14,
//                 ),
//                 // Tab bar view
//                 ConstrainedBox(
//                   constraints: BoxConstraints(maxHeight: double.infinity),
//                   child: SizedBox(
//                     // color: Colors.amber,
//                     height: 180,
//                     // height: double.infinity,
//                     child: Column(
//                       children: [
//                         Expanded(
//                           child:
//                               TabBarView(controller: tabController, children: [
//                             // HomeTabContainer(),
//                             // PlotTabContainer(),
//                             // CommercialTabContainer()
//                             HomeTabChoiceChips(),
//                             // HomeTabChoiceChips(),
//                             PlotTabChoiceChips(),
//                             CommercialTabChoiceChips()
                      
//                           ]),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 Divider(
//                   color: Colors.white,
//                 ),
//                 SizedBox(height: 20,),
//                 ElevatedButton(onPressed: (){
//                   print(adController.selectedId.toString());
//                   print(adController.selectedPropertyId.toString());
//                   print(adController.selectedName.toString());
//                 }, child: Text('Call'))
//           ],
//         ),
//       ),
//     );
//   }
// }