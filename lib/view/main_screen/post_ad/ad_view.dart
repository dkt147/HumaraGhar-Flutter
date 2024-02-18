import 'package:HumaraGhar/List/list_of_cities.dart';
import 'package:HumaraGhar/components/add_city_bottom_sheet.dart';
import 'package:HumaraGhar/components/choice_chips/bathroom_choice_chips_ad.dart';
import 'package:HumaraGhar/components/choice_chips/bedroom_choice_chips_ad.dart';
import 'package:HumaraGhar/components/multiValueDialog/NearbyDialoge/nearbyDialogView.dart';
import 'package:HumaraGhar/components/multiValueDialog/OtherFeaturesDialog/otherDialogView.dart';
import 'package:HumaraGhar/components/multiValueDialog/PlotFeaturesDialog%20copy/plotDialogView.dart';
// import 'package:HumaraGhar/components/multiValueDialog/NearbyFeaturesDialog/selectedNearbyLoactionView.dart';
// import 'package:HumaraGhar/components/multiValueDialog/OtherFeaturesDialog/otherFeaturesView.dart';
// import 'package:HumaraGhar/components/multiValueDialog/PlotFeaturesDialog/plotFeaturesView.dart';
import 'package:HumaraGhar/components/round_button.dart';
import 'package:HumaraGhar/components/switch_button/installment_switch_button.dart';
import 'package:HumaraGhar/components/switch_button/possession_switch_button.dart';
import 'package:HumaraGhar/components/switch_button/switch_controller.dart';
import 'package:HumaraGhar/routes/routes_name.dart';
import 'package:HumaraGhar/utils/background_container.dart';
import 'package:HumaraGhar/view-model/Ad_Controller/ad_controller.dart';
import 'package:HumaraGhar/view-model/navbar_controller/navbar_controller.dart';
import 'package:HumaraGhar/view/main_screen/post_ad/components/adPost_tab_container.dart';
import 'package:HumaraGhar/view/main_screen/post_ad/components/dropDown_button.dart';
import 'package:HumaraGhar/view/main_screen/post_ad/components/purpose_choice_chip.dart';
import 'package:HumaraGhar/view/main_screen/profile_view/my_properties/my_properties.dart';
import 'package:HumaraGhar/view/main_screen/profile_view/my_properties/my_properties_list.dart';
import 'package:HumaraGhar/view/main_screen/projects_view/new_project_details.dart';
import 'package:HumaraGhar/view/main_screen/projects_view/project_list.dart';
import 'package:HumaraGhar/view/main_screen/search_view/search_location.dart';
import 'package:HumaraGhar/view/navbar/navbar.dart';
import 'package:HumaraGhar/view/test_screens/dscriptionBottomSheet.dart';
import 'package:HumaraGhar/view/test_screens/image_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../components/multiValueDialog/MainFeaturesDialog/selectedMainFeaturesView.dart';

class PostAdView extends StatefulWidget {
  
  const PostAdView({super.key});

  @override
  State<PostAdView> createState() => _PostAdViewState();
}

class _PostAdViewState extends State<PostAdView> with TickerProviderStateMixin {
  

  List PurposeOfAD = ['Sale' , 'Rent Out'];

  bool isSelected = false;
  

  bool installmentsAvailable = false;
  bool posssesionReady = false;

      // Controllers

final  projectPriceController = TextEditingController();
final  projectAreaController = TextEditingController();
final  projectTitleController = TextEditingController();
final  projectDescriptionController = TextEditingController();
final  projectEmailController = TextEditingController();
final  projectContactController = TextEditingController();

  @override
  Widget build(BuildContext context)
   {
    SwitchController switchController = Get.put(SwitchController());
    AdController adController =  Get.put(AdController());          
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
     late TabController tabController = TabController(length: 3, vsync: this);
    return BackgroundContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Post an Ad'),
        ),
        body: Padding(
                    padding: const EdgeInsets.only(left : 14.0 , right: 14.0 , top: 2.0),
                    child:
                     SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                                Text('Pupose' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize: 22),),
                                  SizedBox(height: 12,),
                                Container(height: 40,
                                // color: Colors.amber,
                                  // prupose of Ad
                                  child: Row(
                                    children: [
                                      PurposeChoiceChip(),
                                   
                                    ],
                                  ),
                                 
                                  ),
                                Divider(color: const Color.fromARGB(255, 255, 255, 255),),
                                SizedBox(height: 14,),
                                Text('Select Property Type' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize: 22),),
                                SizedBox(height: 14,),
                
                                    // Tabs
                                Container(
                                  width: width * .8 ,
                                  child: TabBar(
                                    // indicatorSize: TabBarIndicatorSize.label,
                                    labelColor: Color.fromARGB(255, 20, 59, 89),
                                    isScrollable: true,
                                    // indicatorColor: Color.fromARGB(255, 20, 59, 89),
                                    indicatorColor: Colors.green,
                                    dividerColor: Color.fromARGB(0, 35, 112, 119),
                                    controller: tabController,
                                    tabs: [
                                    Text('Homes' , style: GoogleFonts.roboto(fontSize: 14 , fontWeight: FontWeight.w500),),
                                    Text('Plots', style: GoogleFonts.roboto(fontSize: 14 , fontWeight: FontWeight.w500),),
                                    Text('Commercial' , style: GoogleFonts.roboto(fontSize: 14 , fontWeight: FontWeight.w500),),
                                   ]),
                                ),
                                SizedBox(height: 14,),
                                    // Tab bar view
                                ConstrainedBox(
                                  constraints: BoxConstraints(maxHeight: double.infinity),
                                  child: SizedBox(
                                    // color: Colors.amber,
                                    height: 180,
                                    // height: double.infinity,
                                     child: Column(
                                       children: [
                                         Expanded(
                                           child: 
                                           TabBarView(
                                            controller: tabController,
                                            children: [
                                              HomeTabContainer(),
                                              PlotTabContainer(),
                                              CommercialTabContainer()
                                              // homesTabContainer(),
                                              // PlotsTabContainer(),
                                              // commercialTabContainer(),
                                             
                                           ]),
                                         ),
                                       ],
                                     ),
                                   ),
                                ),
                               
                                Divider(color: Colors.white,),
                      
                            // Select City
                                AddCityBottomSheet(citiesList: citiesList, height: height * 1.4, width: width),
                      
                                 Divider(color: Colors.white,),
                            // Select Location
                                 InkWell(
                            onTap: () {
                              Get.to(SearchLocationScreen());
                            },
                            child: Container(
                                         height: height * .08,
                                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Column(mainAxisAlignment: MainAxisAlignment.center,
                              
                              children: [Padding(
                                padding: const EdgeInsets.symmetric(vertical : 12.0),
                                child: Text('Select Location' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                              )],
                            ),
                            Icon(Icons.arrow_forward_ios , color: Colors.white,)
                                        ],),
                                      ),
                          ),
                      
                                  Divider(color: Colors.white,),
                
                                 // Area Size
                         Row(
                           children: [
                            Container(
                              child:  PostAdAreaSizeField(height: height, title: 'Area Size', 
                              hintText: 'Enter area size', textInputType: TextInputType.number  ,
                              controller: projectAreaController, ),
                               
                            ),
                           ],
                         ),           
                 
                               // Total price for sell and  Monthly Rent
                                    // Write conditions for it
                         PostAdTextField(height: height, title: 'Project Price', 
                          hintText: 'Enter amount', textInputType: TextInputType.number ,  controller: projectPriceController),           
                          
                                   // Installments Available Switch
                    // Visibility(
                    //   visible: (adController.choice.value == 'Sale'),
                    //   // visible: (true),
                    //   child: 
                    //   Container(
                    //     height: height * .1,
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text('Installments Available' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                    //         InstallmentSwitchButton()
                            
                       
                    //       ],
                    //     ),
                    //   ),
                    // ) ,
                    // Divider(color: Colors.white,),
                    SizedBox(height: 25,),
                    Center(child: Text('Select Features & Amenities' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize: 22),)),
                    SizedBox(height: 12,),
                    Padding(
                      padding: const EdgeInsets.symmetric( horizontal :  40),
                      child: Divider(color: Colors.white, ),
                    ),
                    SizedBox(height: 12,),

                      // Dialog Selected VALUES

                    SelectdMainFeaturesView(title: 'Select Main Features',),
                    
                    Divider(color: Colors.white,),
                    NearbyDialogView(title: 'Nearby Location'),
                    
                    Divider(color: Colors.white,),
                    OtherDialogView(title: 'Other Facilities'),
                    
                    Divider(color: Colors.white,),
                    PlotDialogView(title: 'Plot Features'),
                    
                    if(switchController.installmentSwitchState == false)
                      Container(
                        height: height * .1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Installments Available' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                                InstallmentSwitchButton(),
                              ],
                            ), ],
                        ),
                      ),
                      
                    

                      if(switchController.installmentSwitchState == true)
                      Container(
                        height: height * .1,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Installments Available' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                                InstallmentSwitchButton(),
                              ],
                            ),
                            
                              Column(
                              children: [
                            if(switchController.installmentSwitchState == true)
                            Container(
                                height: 20,
                                width: 20,
                                color: Colors.red,
                              
                              )
                            
                              ],
                            )
                          ],
                        ),
                        
                      ),
                      

                   
                    Divider(color: Colors.white,),
                         // Ready for Possesion Switch
                    Container(
                      height: height * .1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Ready for Possesion' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                          PossessionSwitchButton()
                         
                        ],
                      ),
                    ) ,
                
                    Divider(color: Colors.white,),
                                        // BedRooms
                        Container(
                        // height: height * .15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Bedrooms' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                              SizedBox(height: 4,),
                                BedroomChoiceChipWidgetAdScreen(numberOfChips: 10)
                    
                              
                                           ],
                        ),
                        ),
                      
                       
                      
                      
                          Divider(color: Colors.white,),
                        
                            // Bathrooms
                        Container(
                        // height: height * .1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Bathrooms' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                              SizedBox(height: 10,),
                              // Flexible(
                                
                                // child: 
                                BathroomChoiceChipWidgetAdScreen(numberOfChips: 6,) 
                                // ListView.builder(
                                //     scrollDirection: Axis.horizontal,
                                //     itemCount: 6,
                                //     itemBuilder: (context , index){
                                //       return Padding(
                                //         padding: EdgeInsets.only(right: 12),
                                //         child: BuildChoiceWidget(label: (index + 1).toString(),
                                //          isSelected: isSelected));
                                //     }),
                              // )
                              
                                           ],
                        ),
                              ),
                      
                      
                          Divider(color: Colors.white,),
                      
                                   // Project Title
                          PostAdTextField(height: height, title: 'Project Title', 
                          hintText: 'Enter proect title', textInputType: TextInputType.text ,controller: projectTitleController),           
                
                                          // Project Description
               
                          // PostAdTextField(height: height, title: 'Project Description', 
                          // hintText: 'Enter project description', textInputType: TextInputType.text  ,controller: projectDescriptionController),
                

                         AdDescriptionContainer(),

                        
                        Divider(color: Colors.white,),
                    //       Container(
                    //   height: height * .1,
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text('Project Description' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                         
                         
                    //     ],
                    //   ),
                    // ) ,
                
                                             // Email ADDRESS
                          PostAdTextField(height: height, title: 'Email Address', 
                          hintText: 'Enter your valid email address', textInputType: TextInputType.emailAddress  ,controller: projectEmailController),
                
                
                          PostAdContactField(height: height, title: 'Contact', 
                          hintText: 'Enter your contact number', controller: projectContactController),


                          // MyImagePickerScreen()
                        ],
                      ),
                    ),
                  ),
                  bottomNavigationBar: StickeyFooter(
                height: height * .12,
                title: projectTitleController.text,
                description: projectDescriptionController.text,
                location: projectAreaController.text,
                price: projectPriceController.text,
                contactInfo: projectContactController.text
              ),
                ),
           
        
      );
    
  }


  /********************************** Custom Widgets ***********************************/ 

   Container PostAdContactField({required height ,required title ,required hintText , required TextEditingController controller }) {
    return Container(
            height: height * .18,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                SizedBox(height: 8,),
                Text(title , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                  SizedBox(height: 12,),
                  Flexible(
                    
                    child: IntlPhoneField(
                      initialCountryCode: 'PK',
                      controller: controller ,
                      keyboardType: TextInputType.number,
                       style: GoogleFonts.notoSansCaucasianAlbanian(color: Colors.black),
                      cursorColor: const Color.fromARGB(255, 20, 75, 102),
                      decoration: InputDecoration(
                        
                        hintText: hintText,
                        hintStyle: TextStyle(color: Color.fromARGB(155, 67, 57, 57)),
                          enabledBorder: UnderlineInputBorder(     
                             
                    borderSide: BorderSide(color: const Color.fromARGB(255, 59, 76, 78)),   
                    ),  
                    focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: const Color.fromARGB(255, 22, 66, 72)),
                 ),  
                      ),
                    )
                  )],
            ), 
            );}
 
  


  Container PostAdTextField({required height ,required title ,required hintText , required TextEditingController controller ,required TextInputType? textInputType }) {
    return Container(
            height: height * .1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                SizedBox(height: 14,),
                Text(title , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                  SizedBox(height: 20,),
                  Flexible(
                    
                    child: TextField(
                      controller: controller ,
                      keyboardType: textInputType,
                      
                       style: GoogleFonts.notoSansCaucasianAlbanian(color: Colors.black),
                      cursorColor: const Color.fromARGB(255, 20, 75, 102),
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: hintText,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        hintStyle: TextStyle(color: Color.fromARGB(155, 67, 57, 57)),
                          enabledBorder: UnderlineInputBorder(   
                            
                             
                    borderSide: BorderSide(color: const Color.fromARGB(255, 59, 76, 78)),   
                    ),  
                    focusedBorder: UnderlineInputBorder(
                      
                    borderSide: BorderSide(color: const Color.fromARGB(255, 22, 66, 72)),
                    ),),)),
                  
                               ],
            ),
                  );
  }
 

  Container PostAdAreaSizeField({required height ,required title ,required hintText , required TextEditingController controller ,required TextInputType? textInputType }) {
    return Container(
            height: height * .15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text(title , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize : 18),),
                SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                      Container(
                       width: MediaQuery.of(context).size.width * 0.6,
                      child: TextField(
                          controller: controller ,
                          keyboardType: textInputType,
                          
                           style: GoogleFonts.notoSansCaucasianAlbanian(color: Colors.black),
                          cursorColor: const Color.fromARGB(255, 20, 75, 102),
                          decoration: InputDecoration(
                          isDense: true,
                          hintText: hintText,
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                          hintStyle: TextStyle(color: Color.fromARGB(155, 67, 57, 57)),
                          enabledBorder: UnderlineInputBorder(   
                                
                                 
                        borderSide: BorderSide(color: const Color.fromARGB(255, 59, 76, 78)),   
                        ),  
                        focusedBorder: UnderlineInputBorder(
                          
                        borderSide: BorderSide(color: const Color.fromARGB(255, 22, 66, 72)),
                        ),),),        ),

                      SizedBox(width: 20,),
                       // Container with Dropdown
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                   child: DropDownButton()
                        ),
                  ],
                )
              
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       flex: 2,
                  //       child: Container(
                  //         child: TextField(
                  //           controller: controller ,
                  //           keyboardType: textInputType,
                            
                  //            style: GoogleFonts.notoSansCaucasianAlbanian(color: Colors.black),
                  //           cursorColor: const Color.fromARGB(255, 20, 75, 102),
                  //           decoration: InputDecoration(
                  //             isDense: true,
                  //             hintText: hintText,
                  //             contentPadding: EdgeInsets.symmetric(vertical: 15),
                  //             hintStyle: TextStyle(color: Color.fromARGB(155, 67, 57, 57)),
                  //               enabledBorder: UnderlineInputBorder(   
                                  
                                   
                  //         borderSide: BorderSide(color: const Color.fromARGB(255, 59, 76, 78)),   
                  //         ),  
                  //         focusedBorder: UnderlineInputBorder(
                            
                  //         borderSide: BorderSide(color: const Color.fromARGB(255, 22, 66, 72)),
                  //         ),),),
                  //       ),
                  //     ),
                  //    Expanded(
                  //     flex: 1,
                  //     child: Container(child: DropDownButton()))

                    
                  //   ],
                  // ),
                  
                               ],
            ),
                  );
  }
 
 
//   Widget homesTabContainer(){
//     return ConstrainedBox(
//             constraints: BoxConstraints(
//         maxHeight: double.infinity
//       ), 
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical :  8.0),
//         child: ConstrainedBox(
//           constraints: BoxConstraints(maxHeight: double.infinity),
//           child: Container(
            
//             child: Wrap(
//               spacing: 8,
//               runSpacing: 12,
//               children: [
//                 BuildChoiceWidget(label: 'House', isSelected: isSelected),
//                 BuildChoiceWidget(label: 'Flat', isSelected: isSelected),
//                 BuildChoiceWidget(label: 'Upper Portion', isSelected: isSelected),
//                 BuildChoiceWidget(label: 'Lower Portion', isSelected: isSelected),
//                 BuildChoiceWidget(label: 'Farm House', isSelected: isSelected),
//                 BuildChoiceWidget(label: 'Room', isSelected: isSelected),
//                 BuildChoiceWidget(label: 'Penthouse', isSelected: isSelected),
//               ],
//             )
//           ),
//         ),
//       ),
//     );
//   }

// Widget PlotsTabContainer(){
//     return ConstrainedBox(
//       constraints: BoxConstraints(
//         maxHeight: double.infinity
//       ), 
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical :  8.0),
//         child: Container(
//           child: Wrap(
//             spacing: 8,
//             runSpacing: 12,
//             children: [
//               BuildChoiceWidget(label: 'Resident Plot', isSelected: isSelected),
//               BuildChoiceWidget(label: 'Commercial Plot', isSelected: isSelected),
//               BuildChoiceWidget(label: 'Agriculture Land', isSelected: isSelected),
//               BuildChoiceWidget(label: 'Industrial Land', isSelected: isSelected),
//               BuildChoiceWidget(label: 'Plot File', isSelected: isSelected),
//               BuildChoiceWidget(label: 'Plot Form', isSelected: isSelected),
//             ],
//           )
//         ),
//       ),
//     );
//   }

//   Widget commercialTabContainer(){
//     return ConstrainedBox(
//       constraints: BoxConstraints(
//         maxHeight: double.infinity
//       ), 
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical :  8.0),
//         child: Container(
        
//           child: Wrap(
//             spacing: 8,
//             runSpacing: 12,
//             children: [
//               BuildChoiceWidget(label: 'Office', isSelected: isSelected),
//               BuildChoiceWidget(label: 'Shop', isSelected: isSelected),
//               BuildChoiceWidget(label: 'Wear House', isSelected: isSelected),
//               BuildChoiceWidget(label: 'Factory', isSelected: isSelected),
//               BuildChoiceWidget(label: 'Building', isSelected: isSelected),
//               BuildChoiceWidget(label: 'Office', isSelected: isSelected),
//             ],
//           )
//         ),
//       ),
//     );
//   }

 Widget StickeyFooter({height , title , description , location , contactInfo , price}){
  BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());   
    return Container(
      color:Color.fromARGB(255, 29, 11, 129),
      // height: height ,
      height: 55 ,
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * .08,),
            Padding(
              padding: const EdgeInsets.symmetric( horizontal : 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    InkWell(
                      onTap: (){
                        Get.toNamed(RouteName.draftView);
                      },
                      child: Text('Save as Draft' , style: GoogleFonts.roboto(fontWeight: FontWeight.w500 , color: Colors.white),)),
                    RoundButton(title: 'Post Ad', onTap: (){
                      newProjectList.add(NewProjectDetails(
                        imageList: ['assets/houses/house3.jpg' , 'assets/houses/house4.jpg' , 'assets/houses/house6.jpg'], 
                        title: title, 
                        description: description, 
                        rentOrPrice: price, 
                        location: location, 
                        ownerContactInfo: contactInfo));
                       
      
      
                                      // Add property in my property list
                       myPropertyList.add(
                        MyProperties(
                        imageList: ['assets/houses/house3.jpg' , 'assets/houses/house4.jpg' , 'assets/houses/house6.jpg'], 
                        title: title, 
                        description: description, 
                        rentOrPrice: price, 
                        location: location, 
                        ownerContactInfo: contactInfo)
                       );
                  Get.to(NavigationPage());
                  bottomNavigationController.changeIndex(1);
                  print(title);
                  print(price);
                  print(location);
                    }, loading: false , width:  200, height: 40,)
                ],
              ),),
          ],
        ),
      ),
    );
 }


}
