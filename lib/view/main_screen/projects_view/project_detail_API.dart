 import 'dart:io';

import 'package:HumaraGhar/API%20testing/Favorites/postFavoriteProperties/post_Favorite_model.dart';
import 'package:HumaraGhar/API%20testing/Favorites/postFavoriteProperties/post_fav_handeler.dart';
import 'package:HumaraGhar/API%20testing/Properties/getProperties/propertyListModel.dart';
import 'package:HumaraGhar/utils/app_colors.dart';
import 'package:HumaraGhar/utils/background_container.dart';
import 'package:HumaraGhar/view-model/navbar_controller/navbar_controller.dart';
import 'package:HumaraGhar/view/main_screen/favorites_view/myFavoritesList.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

    ///   New With Api
               // Project Detail with API
class ProjectDetails extends StatefulWidget {
  final Property property ;



  const ProjectDetails({
    super.key,  required this.property, 
  });
  
  get newProjectDetails => null;

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();

}

class _ProjectDetailsState extends State<ProjectDetails> {

  bool isFav = false;
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return BackgroundContainer(
      child: Scaffold(
         body : SafeArea(
          child: Container(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                  
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
          
                  
                           // Image Slider
                          // ImageSlider(height: height),
                  carouselWithIndicator(
                    height: height,
                    imageUrl: widget.property.propertyAttachments[0].url,
                    title: widget.property.name,
                    price: 2,
                    description: 'Good propery',
                    location:  widget.property.propertyLocations[0].name,
                    contactInfo: widget.property.propertyDevelopers[0].phone,
                    isFavorite: isFav,
                    userID: widget.property.name,
                    propertyID: widget.property.propertyLocations[0].name
                    
                  ),
                  
                  
                    SizedBox(height: height * .02,),
                 
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * .03),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         
                    
                            // with object
                      Text(widget.property.name , style: GoogleFonts.robotoFlex(fontSize: 26 , fontWeight: FontWeight.bold , color: Colors.white),),
                      Text(widget.property.propertyCity.name, style: GoogleFonts.robotoFlex(fontSize: 20 , fontWeight: FontWeight.w500 , color: Colors.white)),
                      
                      SizedBox(height: height * .02,),
                          Divider(color: Colors.white,),
                               SizedBox(height: height * .02,),
                  
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Price' , style: GoogleFonts.robotoFlex(fontSize: 23 , fontWeight: FontWeight.w600 , color:  Colors.white)),
                          Text(widget.property.price, style: GoogleFonts.robotoFlex(fontSize: 22 , fontWeight: FontWeight.w600 , color:  Colors.white)),
                        ],
                      ),
                           SizedBox(height: height * .02,),
          
                       Divider(color: Colors.white,),
                      SizedBox(height: height * .02,),
          
                      // Features
          
                    featureMainContainer( internalContainerWidth: width * .4),
                      
          
                      Divider(color: Colors.white,),
                      SizedBox(height: height * .02,),
                  
                      Text('Property Details ', style: GoogleFonts.robotoFlex(fontSize: 26 , 
                      fontWeight: FontWeight.bold , color : Colors.white),),
              
                        SizedBox(height: height * .02,),

                           Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('No of Bedrooms :' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w500 , fontSize: 18 ),),
                             Text(widget.property.floorPlans[0].title , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w500 , fontSize: 18 ),),
                          ],
                        ),
                        SizedBox(height: height * .01,),
                        //    Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text('No of Bedrooms :' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w500 , fontSize: 18 ),),
                        //      Text(widget.property.propertyHouseTypes. , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w500 , fontSize: 18 ),),
                        //   ],
                        // ),
                        SizedBox(height: height * .01,),
                           Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('No of Bedrooms :' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w500 , fontSize: 18 ),),
                             Text(widget.property.floorPlans[0].title , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w500 , fontSize: 18 ),),
                          ],
                        ),
                        SizedBox(height: height * .01,),


                        // Text( , style: TextStyle(color: Colors.white),),
          
                        
                      Divider(color: Colors.white,),
                      SizedBox(height: height * .02,),
                      
                      
                      mapLocation( height * .3 , widget.property.propertyLocations[0].location),
                      
                      Divider(color: Colors.white,),
                      SizedBox(height: height * .02,),
          
                      
                      Center(
                        child: Text('Owner Info', style: GoogleFonts.robotoFlex(fontSize: 24 , 
                        fontWeight: FontWeight.bold , color : Colors.white),),
                      ),
              
                        SizedBox(height: height * .02,),
          
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Builders :' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w600 , fontSize: 18 ),),
                             Text(widget.property.propertyDevelopers[0].name , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w600 , fontSize: 18 ),),
                          ],
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Email :' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w600 , fontSize: 18 ),),
                             Text(widget.property.propertyDevelopers[0].email , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w600 , fontSize: 18 ),),
                          ],
                        ),
          
                      SizedBox(height: 10,)
                      // Divider(color: Colors.white,),
                      //      SizedBox(height: height * .1,),
                  
          
            //                    Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [  customButtons(
            //               height: height ,
            //               width: width ,
            //               title: 'Buy Now',
            //               color: Color.fromARGB(255, 15, 78, 16)),
            
            
            //              customButtons(
            //               height: height ,
            //               width: width ,
            //               title: 'Reserved',
            //                color: Color.fromARGB(255, 16, 57, 92))
            // ],
            //           ),
            
                  // SizedBox(height: height * .02,)
                          
                       
                        ],
                      ),
                    ),
                 ],),
            ),
          ),
        )
      ,
      bottomNavigationBar:
       Container(
        // color: Colors.red,
        // height: height * .12 ,
        child: StickeyFooter(height: height , phoneNumber: widget.property.propertyDevelopers[0].phone),
      )
      
      //  Container(
      //   child: StickeyFooter(height: height),
          
        
      // ),
      ),
    );
  }
  

  /**************************** Custom Widgets *****************************/

  CarouselSlider ImageSlider({required height}) {
    return CarouselSlider(
           
          items:  widget.property.propertyAttachments.map((attachment) =>
      Image.network(
        attachment.url,
        fit: BoxFit.cover,
        width: double.infinity,
      )
    ).toList(),
          options: CarouselOptions(
            // Customize options as needed
             autoPlay: false,
             reverse: false,
                aspectRatio: 12/9,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                });
              },
              
            viewportFraction: 1,
          ),
        );
  }




 customButtons({height , width , title , color = Colors.amber }  ){
  return InkWell(
                  onTap: (){},
                  child: Container(
                    height: height * .05,
                    width: width * .4,
                    decoration: BoxDecoration(
                      
                      color: color ,
                      borderRadius: BorderRadius.circular(28)
                    ),
                    child: Center(child: Text(title, style: GoogleFonts.robotoFlex(fontSize: 18 , fontWeight: FontWeight.w700 , color: Colors.white)),
                  ),
                ) );
 }


 Widget carouselWithIndicator({height , title , description , required imageUrl ,  price , location , contactInfo , isFavorite ,required userID ,required propertyID} ){
    BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());   
  // bool isAlreadyFavorite;
  return Stack(
    children: [
  ImageSlider(height: height ),

            // Favorite Icon
          Positioned(
        top: 10 ,
        right : 10 ,
        child:   Row(
          children: [
            InkWell(
              onTap: (){
                FavoriteProperty favoriteProperty = FavoriteProperty(
                  user_id: userID, property_id: propertyID);
                  
                  MyFavorites myFavorites = MyFavorites(
                       imageList: ['sadas' , 'dasdsa'], 
                      title: title, 
                      description: 'SADASDSA', 
                      rentOrPrice: '4334', 
                      location: location, 
                      ownerContactInfo: contactInfo,
                      isFavorite: isFavorite
                      );


                  if (isFavorite ){
                    // favoriteList.remove(myFavorites);
                    print('Remove from favorite');
                    setState(() {
                      
                    isFavorite = false;
                    });
                
                  }
     
                
                  else{
                    isFavorite = true;
                    // favoriteList.add(myFavorites);
                    print('Add to favorite');
                    postFavoriteProperty(favoriteProperty);
                    // Get.to(NavigationPage());
                    // bottomNavigationController.changeIndex(3);
                    setState(() {
                      
                    isFavorite = false;
                    });
                  
                  } 

                  
              },
            
            
            child:  CircleAvatar(backgroundColor: Colors.transparent, child: isFavorite ? Icon   (  Icons.favorite , color:  Colors.red, size: 25,) : Icon   (  Icons.favorite_outline , color:  Colors.black, size: 25,),)),
            SizedBox(width: 1,),
            CircleAvatar(backgroundColor: Colors.transparent, child: Icon(Icons.share , color: Colors.black, size: 25,),),
            
          ],
        )
          ,), 
            // Back Button
          Positioned(
        top: 10 ,
        left : 10 , 
        child:InkWell(
                    onTap: (){Get.back();},
                    child: CircleAvatar(
                      backgroundColor:Color.fromARGB(253, 14, 50, 98),
                      radius: height * .02,
                      child: Center(child: SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(left : 8.0),
                          child: Icon(Icons.arrow_back_ios , color: Colors.white),
                        ))),
                    ),
                  ),),
              // indicator
          Positioned(
                bottom: 10,
                left : 0 , 
                right : 0,
               child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                    Center(
                child: AnimatedSmoothIndicator(activeIndex: activeIndex , count: widget.property.propertyAttachments.length,
                    effect: ScrollingDotsEffect(
                    dotWidth: 8,
                    dotHeight: 8,
                    activeDotColor: Color.fromARGB(255, 19, 133, 44),
                    dotColor: Colors.white,
                    ),
                    ),
              ),

                 ],
               ),
                ),
              
    ],
  );
 }
 

 Widget mapLocation(height , locationUrl){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    
    children: [
      Text('Location', style: GoogleFonts.robotoFlex(fontSize: 20 , 
                      fontWeight: FontWeight.bold , color : Colors.white),),
      SizedBox(height: 12,),
      Stack(
        children: [
          Container(
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            color: Colors.black45,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset('assets/images/map.png' , fit: BoxFit.cover , )),
          ),
          
      Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(122, 0, 0, 0),  
          borderRadius: BorderRadius.circular(4),
        ),
        
      ),

      
      Positioned(child: ElevatedButton(child: Text('See on Map')  , onPressed: (){
        openMap(locationUrl: locationUrl);
      }
    ),
      bottom: height * .4,
      right:  height * .5 ,
       )

      ],),
    ],
  );
 }

Widget featureMainContainer({required internalContainerWidth}){
  return ConstrainedBox(
    constraints: BoxConstraints(
      maxHeight: double.infinity
    ),
    child: Container(
      width: double.infinity,
    
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          //  color: Color.fromARGB(80, 0, 0, 0),
        ),
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Features' ,style: GoogleFonts.robotoFlex(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.white)),

          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [ 
              featuresInsideContainer(
                internalContainerWidth: internalContainerWidth,
                featureHeading: 'Main Features',
                feature1: 'Electricity backup',
                feature2: 'Generator , UPS',
              ),
              featuresInsideContainer(
                internalContainerWidth: internalContainerWidth,
                featureHeading: 'Plot Features',
                feature1: 'Electricity',
                feature2: 'Security Staff',
              ),
            ],),
          SizedBox(height: 12,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [ 
              featuresInsideContainer(
                internalContainerWidth: internalContainerWidth,
                featureHeading: 'Business And Communication',
                feature1: 'Broadband Internet Access',
                feature2: 'Cable TV Ready',
              ),
              featuresInsideContainer(
                internalContainerWidth: internalContainerWidth,
                featureHeading: 'Other Facilities',
                feature1: 'CCTV',
                feature2: 'Security Staff',
              ),
             ],)
         
        ],
       ),
     ), 
    ),
  );
}

ConstrainedBox featuresInsideContainer({internalContainerWidth , featureHeading ,  feature1 , feature2 }){
  return ConstrainedBox(
           constraints: BoxConstraints(
              maxHeight: double.infinity
            ),
           child: Container(
            // height: internalContainerHeight,
            width: internalContainerWidth,
            color: Colors.black45,
                 child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(featureHeading , style:  GoogleFonts.robotoFlex(fontSize: 14 , fontWeight: FontWeight.w600 , color: Color.fromARGB(255, 255, 255, 255)),),
                      SizedBox(height: 6,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal : 8.0 , ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Row(
                                children: [
                                  Icon(Icons.check , color: const Color.fromARGB(255, 19, 149, 255), size: 14 ),
                                  SizedBox(width: 6,),
                                  Flexible(child: Text(feature1 , style:  GoogleFonts.robotoFlex(fontSize: 12 , fontWeight: FontWeight.w400 , color: Color.fromARGB(255, 226, 226, 226)),)),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.check , color: const Color.fromARGB(255, 14, 146, 255), size: 14 ),
                                  SizedBox(width: 6,),
                                  Flexible(child: Text(feature2 , style:  GoogleFonts.robotoFlex(fontSize: 12 , fontWeight: FontWeight.w400 , color: Color.fromARGB(255, 226, 226, 226)),)),
                                ],
                              ),
                              
                                        
                          ],
                        ),
                      )
                  ],
                ),
                       ),
            
                   ),
         );
}

 Widget StickeyFooter({height , width ,phoneNumber}){
    return Container(
         
      decoration: BoxDecoration(
        // color:Color.fromARGB(197, 73, 203, 171),
        color:AppColors.BottomNavigationColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10)  , topRight: Radius.circular(10)),
              
      ),
      // color:Color.fromARGB(0, 29, 11, 129),
      // color:AppColors.BottomNavigationColor,
      // height: height  ,
      height: 55  ,

      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * .01,
          ),
          Padding(
            padding: const EdgeInsets.symmetric( horizontal : 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.start,              
              children: [
                squareButton(
                    onTap: ()=> openPhoneApp(phoneNumber: phoneNumber),
                    height: height ,  buttonColor: Color.fromARGB(255, 0, 0, 0) , titleColor: Colors.white,
                     buttonTitle: 'Call' , buttonIcon: Icons.call , iconColor : Colors.white 
                  ),
                  squareButton(
                    onTap: ()=>openWhatsApp(phoneNumber: phoneNumber),
                    height: height , buttonColor: Colors.black , titleColor: const Color.fromARGB(255, 52, 138, 55),
                     buttonTitle: 'WhatsApp' , buttonIcon: Icons.message , iconColor : const Color.fromARGB(255, 52, 138, 55) 
                  ),
                                 ],
            ),
            
            ),
    
          //   SizedBox(height: height * .04,)
        ],
      ),
    );
 }

 InkWell squareButton( {VoidCallback? onTap , height, width , buttonColor , titleColor  , buttonTitle , buttonIcon , iconColor}) {
   return InkWell(
                  onTap: onTap,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: double.infinity
                    ),
                    child: Container(
                      height: height * .05 ,
                      // width: width  * .25,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(4)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal : 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [ 
                          
                          Icon(buttonIcon , color: iconColor,),
                          SizedBox(width: 8,),
                          Text(buttonTitle , style: GoogleFonts.robotoFlex(color: titleColor , fontWeight: FontWeight.bold , fontSize: 20),)
                        ]),
                      ),                          
                    ),
                  ),
                );
 }


openWhatsApp( {required String phoneNumber}) async{
  

  final Uri whatsApp = Uri.parse('https://wa.me/${phoneNumber}');
  


  // var whatsAppNumber ="923118706843";
  // var whatsAppURL_android = Uri.parse("whatsapp://send?phone" + whatsAppNumber + "&text = hello") ;
  // var whatsAppURL_ios = Uri.parse("https:wa.me/$whatsAppNumber?text=${Uri.parse('hello')}" ) ;
  if(Platform.isIOS){
    // For IOS phone only
    if (await canLaunchUrl(whatsApp)){
        await launchUrl(whatsApp);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('WhatsApp is not installed')));
      }
  }else{
    // For android
        if (await canLaunchUrl(whatsApp)){
        await launchUrl(whatsApp);
    }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('WhatsApp is not installed')));
      }
   }
   
      

}


openPhoneApp({required String phoneNumber}) async {
    final Uri url = Uri(
      scheme: 'tel',
      path: phoneNumber
      );
      if(await canLaunchUrl(url)){
        await launchUrl(url);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Can not call')));
      
      }
}

openMap( {required String locationUrl}) async{
      final Uri location = Uri.parse(locationUrl);
         if (await canLaunchUrl(location)){
            await launchUrl(location);
          }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Map is not installed')));
      }        }
      
}
