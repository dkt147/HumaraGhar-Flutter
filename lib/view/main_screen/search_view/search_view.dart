
import 'package:HumaraGhar/API/SearchProperty/search_model.dart';
import 'package:HumaraGhar/API/SearchProperty/search_property_service.dart';
import 'package:HumaraGhar/API/property%20testing/Properties/getProperties/propertyListModel.dart';
import 'package:HumaraGhar/components/add_city_bottom_sheet.dart';
import 'package:HumaraGhar/components/choice_chips/bathroom_choice_chips_filter.dart';
import 'package:HumaraGhar/components/choice_chips/bedroom_choice_chips_filter.dart';
import 'package:HumaraGhar/components/round_button.dart';
import 'package:HumaraGhar/routes/routes_name.dart';
import 'package:HumaraGhar/utils/Navigation_Drawer/navigation_drawer.dart';
import 'package:HumaraGhar/constants/background_container.dart';
import 'package:HumaraGhar/components/CustomAnimatedToggleButton.dart';
import 'package:HumaraGhar/view-model/city_controller/city_controller.dart';
import 'package:HumaraGhar/view-model/navbar_controller/navbar_controller.dart';
import 'package:HumaraGhar/view/main_screen/projects_view/filter_projects_view.dart';
import 'package:HumaraGhar/view/main_screen/projects_view/projects_view.dart';
import 'package:HumaraGhar/view/main_screen/search_view/filter_property_onSearch.dart';
import 'package:HumaraGhar/view/main_screen/search_view/search_nearby_locaton.dart';
import 'package:HumaraGhar/view/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchView extends StatefulWidget {
  
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  // bool showImageAd = false;
  // bool showVideoAD = false;
  // bool isBedroomSelected = false;
  // bool isBathroomSelected = false;



  //     List citiesList = [
  //     'Karachi',
  //     'Lahore',
  //     'Peshawar',
  //     'Islamabad',
  //     'Quetta',
  //     'Sakkar',
  //     'Hyderabad',
  //     'Rawalpindi',
  //     'Mansera',
  //     'Sargodha',
  //     'Nawabshah',
  //     'Faizabad',
  //     'Hunza',
  //     'Kashmir',
  // ];

    Future<PropertyListModel>? _propertyListFuture;
  // String? _cityId;
  // String? _locationId;
  // String? _priceMin;
  // String? _priceMax;
  // String? _areaMin;
  // String? _areaMax;
  // String? _agencyId;


  late Future<PropertyListModel> futurePropertyList;

  @override
  void initState() {
    super.initState();
    futurePropertyList = SearchPropertyService.searchProperties();
  }


  TextEditingController searchCityController= TextEditingController();
  TextEditingController searchLocationController= TextEditingController();
  TextEditingController lowerPriceRangeController= TextEditingController();
  TextEditingController upperPriceRangeController= TextEditingController();
  TextEditingController lowerAreaRangeController= TextEditingController();
  TextEditingController upperAreaRangeController= TextEditingController();
  
  List<String> toggleLabels = ['Buy' , 'Rent'];
  int selectedToggleLabel = 1;

  List<bool> isSelected = List.generate(2, (index) => false);

  @override
  Widget build(BuildContext context) {
    final cityController = Get.put(CityController());
        double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return WillPopScope(
      onWillPop: () async {
        return onPop();
      },
      child: BackgroundContainer(
        child:  Scaffold(
        drawer: SideNavigationDrawer(),
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 172, 211, 206),
          ),
          title : Text('Search')
          ),
      body: Padding(
        padding: const EdgeInsets.only(left :  12.0 , right:  12 , top: 2),
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  
                    // Center(child: Text('No Search History Yet ' , style: GoogleFonts.robotoFlex(fontSize: 24 , color: Colors.white , fontWeight: FontWeight.w500),)),
                    // Icon(Icons.not_listed_location , size: 48, color: Color.fromARGB(255, 25, 46, 206),),
                
                        // Buy / Rent
                  Container(
                    height: height * .1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('I want to ' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
            
                    ToggleButton()
                    
                    ],),
                  ),
              
                  Divider(color: Colors.white,),
            
                                 // Select City
                  AddCityBottomSheet( height: height * 1.2, width: width),
                      
            
                      Divider(color: Colors.white,),
            
            
                        // Select Location    
                     Container(
                     height: height * .13,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Column(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                       
                            // Search Location
                       
                        children: [Padding(
                          padding: const EdgeInsets.only(right : 12.0 , top :  12.0 , bottom:12.0  ),
                          child: Text('Select Location' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                        ),
                        Row(children: [
                          InkWell(
                            onTap: () {
                              // Get.toNamed( RouteName.searchLocationView);
                              Get.to( SelectNearbyLocationScreen());
                            },
                            child: Container(
                              // color: Colors.red,
                              height: height * .05,
                              width: width * .65,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 5, 59, 38)
                                ),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: Center(child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal : 12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Search Locations' , style: TextStyle(color: Color.fromARGB(255, 52, 47, 47)),),
                                    Icon(Icons.search, size: 18, color: Colors.grey.shade700 )
                                  ],
                                ),
                              )),
                            ),
                          ),
                          SizedBox(width: width * .04,),
                           InkWell(
                            onTap: (){},
                             child: Container(
                              //  color: Colors.red,
                               height: height * .05,
                              width: width * .22,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 5, 59, 38)
                                ),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: Center(child: Text('Map' , style: TextStyle(color: Color.fromARGB(255, 52, 47, 47)) ,)),
                                               ),
                           )
                        ],)
               
                        ],),
               
                          ],),
                        ),
                  
                            Divider(color: Colors.white,),
            
                            // Price Range
                 ConstrainedBox(
                     constraints: BoxConstraints(
                        maxHeight: double.infinity
                      ),
                    child: Container(
                      //  height: height * .13,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Column(mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        
                          children: [Padding(
                            padding: const EdgeInsets.only(right : 12.0 , top :  12.0 , bottom:12.0  ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Price Range' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                                SizedBox(width: width * .55,),
                                Text('  PKR' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 14),),
                              ],
                            ),
                          ),
                          Row(children: [
                            Center(child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal : 12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                            color: Color.fromARGB(255, 5, 59, 38)
                                      ),
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: SizedBox(
                                      height: height * .06,
                                      width: width* .3, 
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal : 8.0),
                                        child: Center(
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            controller: lowerPriceRangeController,
                                            decoration: InputDecoration(
                                              
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              hintText:'0',
                                              
                                              hintStyle: TextStyle(color: Color.fromARGB(255, 52, 47, 47)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * .085,),
                                  Text('To' , style: GoogleFonts.robotoFlex(fontWeight : FontWeight.w700),),
                                  SizedBox(width: width * .085,),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                            color: Color.fromARGB(255, 5, 59, 38)
                                      ),
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: SizedBox(
                                      height: height * .06,
                                      width: width* .3, 
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal : 8.0),
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          controller: upperPriceRangeController,
                                          decoration: InputDecoration(
                                            // isDense: true,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            hintText:'0',
                                            hintStyle: TextStyle(color: Color.fromARGB(255, 52, 47, 47)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            SizedBox(width: width * .04,),
                             
                          ],)
                                         
                          ],),
                                         
                            ],),
                          ),
                  ),
               
                  SizedBox(height: 12,),
                            Divider(color: Colors.white,),
            
                                      // Area Range
            
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: double.infinity
                      ),
                      child: Container(
                      //  height: height * .13,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Column(mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        
                          children: [Padding(
                            padding: const EdgeInsets.only(right : 12.0 , top :  12.0 , bottom:12.0  ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Area Range' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                                SizedBox(width: width * .55,),
                                Text('Sq. Yd' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 14),),
                              ],
                            ),
                          ),
                          Row(children: [
                            Center(child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal : 12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                            color: Color.fromARGB(255, 5, 59, 38)
                                      ),
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: SizedBox(
                                      height: height * .06,
                                      width: width* .3, 
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal : 8.0),
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          controller: lowerAreaRangeController,
                                          decoration: InputDecoration(
                                            // isDense: true,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            hintText:'0',
                                            
                                            hintStyle: TextStyle(color: Color.fromARGB(255, 52, 47, 47)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * .085,),
                                  Text('To' , style: GoogleFonts.robotoFlex(fontWeight : FontWeight.w700),),
                                  SizedBox(width: width * .085,),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                            color: Color.fromARGB(255, 5, 59, 38)
                                      ),
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: SizedBox(
                                      height: height * .06,
                                      width: width* .3, 
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal : 8.0),
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          controller: upperAreaRangeController,
                                          decoration: InputDecoration(
                                            // isDense: true,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            hintText:'0',
                                            hintStyle: TextStyle(color: Color.fromARGB(255, 52, 47, 47)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            SizedBox(width: width * .04,),
                             
                          ],)
                                           
                          ],),
                                           
                            ],),
                          ),
                    ),
               
            
                    // Divider(color: Colors.white,),

                    // Bedrooms
            /*
                   Container(
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                      Text('Bedrooms' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                      SizedBox(height: 4,),
                      BedroomChoiceChipWidgetFilterScreen(numberOfChips: 10)
                      
                      ],),
                        ),
              */    
                    
              
                  //  Divider(color: Colors.white,),
            
            
                    
                        // Bathrooms
                        /* 
                      Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bathrooms' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                            SizedBox(height: 8,),
                            BathroomChoiceChipWidgetFilterScreen(numberOfChips: 6)
                     
                            
                                         ],
                      ),
                      ),
                    */
            
                // Divider(color: Colors.white,),
                //       // Keywords
                 /* 
                  Container(
                     height: height * .13,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Column(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                        children: [Padding(
                          padding: const EdgeInsets.only(right : 2.0 , top :  12.0 , bottom:12.0  ),
                          child: Text('Add Keywords' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                        ),
                        Row(children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed(RouteName.searchLocationView);
                            },
                            child: Container(
                              // color: Colors.red,
                              height: height * .05,
                              width: width * .75,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 5, 59, 38)
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal : 12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: height * .05,
                                      width: width* .65, 
                                      child: TextField(
                                        controller: searchLocationController,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          hintText:'Try "Shops" , "Upper Portion", etc ',
                                          hintStyle: TextStyle(color: Color.fromARGB(255, 52, 47, 47)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                            ),
                          ),
                          SizedBox(width: width * .04,),
                           Container(
                            //  color: Colors.red,
                             height: height * .05,
                            width: width * .1,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromARGB(255, 5, 59, 38)
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(child: Icon(Icons.add , color: Color.fromARGB(255, 5, 59, 38) ,)),
                          )
                        ],)
               
                        ],),
               
                          ],),
                        ),
               */
            
                  //  Divider(color: Colors.white,),
                        // Ads with videos
                  /*
                  Container(
                    height: height * .1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Show Ads With videos Only' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                        ShowWithVideoSwitch(),
                        // Switch(value: showVideoAD, onChanged: (bool newValue){
                        //   setState(() {
                        //     showVideoAD =  newValue ;
                        //   });
                        // } )
                      ],
                    ),
                  ) ,
              */
              
                  // Divider(color: Colors.white,),
                    
                         // Ads with Picture
                   /*     
                   Container(
                    height: height * .1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Show Ads With Images Only' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                        ShowWithPhototSwitch()
                        
                      ],
                    ),
                  ),
                  */
                  
                  // Divider(color: Colors.white,),
                    
                         // Select Agency
                 /*
                    InkWell(
                      onTap: (){
                        Get.toNamed(RouteName.selectAgencyView);
                      },
                      child: Container(
                      height: height * .1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Select Agency' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                         
                          Icon(Icons.arrow_forward_ios , color: Colors.white,)]),
                            ),
                    ),
                    */
                    
               
                
                  ],),
              ),
            ),

      bottomNavigationBar: Container(
        child: StickeyFooter(
          height: height,
          cityID: cityController.selectedCity.value.id,
          areaMin: lowerAreaRangeController.text.toString(),
          areaMax: upperAreaRangeController.text.toString(),
          priceMin: lowerPriceRangeController.text.toString(),
          priceMax: upperPriceRangeController.text.toString() 
        ),
      ),
        
      ),
      ),
    );
    
  }

   Widget StickeyFooter({height , areaMin , areaMax , priceMin , priceMax , cityID}){
    
   late BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());    
    return Container(
      color:Color.fromARGB(255, 29, 11, 129),
      // color:Color.fromARGB(255, 34, 85, 77),
      height: height  * .06,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric( horizontal : 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                  // InkWell(
                  //   onTap: (){
                  //     Get.toNamed(RouteName.draftView);
                  //   },
                  //   child: 
                  //   Text('Save as Draft' , style: GoogleFonts.roboto(fontWeight: FontWeight.w500 , color: Colors.white),)),
                  RoundButton(title: 'Search', onTap: (){
                  
                  print(upperPriceRangeController.text.toString());
              setState(() {
                SearchPropertyService.searchProperties();
                _propertyListFuture = SearchPropertyService.searchProperties(
                  // agencyId: '0',
                  cityId: cityID,
                  areaMin: areaMin,
                  areaMax: areaMax,
                  priceMin: priceMin,
                  priceMax: priceMax 
                  );
                
                
              });
                  Get.to(FilterProjectOnSearch(
                    isSearchResultView: false,  cityId: cityID,
                  areaMin: areaMin,
                  areaMax: areaMax,
                  priceMin: priceMin,
                  priceMax: priceMax ));
                  // Get.to(FilterProjectsView());
                  // Get.to(NavigationPage());
                  // bottomNavigationController.changeIndex(1);
                  // Get.to(ProjectsView(isSearchResultView: true))?.then((value) {
                  //   bottomNavigationController.changeIndex(1);
                  // });

                  }, loading: false , width:  160, height: 40,)
              ],
            ),
          )
        ],
      ),
    );
 }

     onPop(){
    BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());

    if(bottomNavigationController.selectdIndex != 0 ){
    Get.to(NavigationPage());
    bottomNavigationController.changeIndex(0) ; 
}else{
  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}}
     
}