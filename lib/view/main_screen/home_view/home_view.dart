import 'package:HumaraGhar/components/round_button.dart';
import 'package:HumaraGhar/notifications/notifications_services.dart';
import 'package:HumaraGhar/routes/routes_name.dart';
import 'package:HumaraGhar/utils/Navigation_Drawer/navigation_drawer.dart';
import 'package:HumaraGhar/utils/background_container.dart';
import 'package:HumaraGhar/view-model/navbar_controller/navbar_controller.dart';
import 'package:HumaraGhar/view/main_screen/blogs/news.dart';
import 'package:HumaraGhar/view/main_screen/blogs/news_list.dart';
import 'package:HumaraGhar/view/main_screen/home_view/carousel.dart';
import 'package:HumaraGhar/view/navbar/navbar.dart';
import 'package:HumaraGhar/components/CustomAnimatedToggleButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {

    DateTime timeBackPressed = DateTime.now();
    NotificationServices notificationServices = NotificationServices();
    
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    //notificationServices.isTokenRefresh();
    notificationServices.firebaseInit(context);
    notificationServices.getDeviceToken().then((value) {
      
      print("Device Token $value");
    });
  }
  
  @override
  Widget build(BuildContext context) {
    
       late TabController tabController =TabController(length: 3, vsync: this);
      late BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());    
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return WillPopScope(
      onWillPop: (){
        return onPop();
      },
      child: BackgroundContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: SideNavigationDrawer(),
          appBar: AppBar(
              // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color.fromARGB(255, 172, 211, 206),),
            title: Text('Home'), 
          ),
         
          body: 
                SingleChildScrollView(
                  child: Column(
                    
                    children: [ 
                      SizedBox(
                        height: 10,
                      ),
        
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                        Text('Want to' , style: GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 22, color : Colors.white),),
                        SizedBox(width : 12),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ToggleButton(),
                        ),
                      ],
                    ),
                      SizedBox(
                        height: 10,
                      ),
                    InkWell(
                      onTap: (){
                       
                  Get.to(() => NavigationPage());
                  bottomNavigationController.changeIndex(2);
                      },
                      child: Container(
                        height: height * .05,
                        width: width * .85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal : 12.0),
                          child: Row(
                            children: [
                              Icon(Icons.search , size: 22 , color: Colors.grey,),
                              SizedBox(width: 12,),
                              Flexible(child: Text('Search for plots , homes , shops , offices' ,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.robotoFlex(color: Colors.grey) ,))
                            ],
                          )
                        ),
                      ),
                    ),
      
                    HomeCarousel(),
        
                  propertiesContainer(
                  width :  width * .96,
                   height : height * .54,
                   color : Colors.white,
                   containerHeading: 'Browse Properties',
                   tabController: tabController
                  ),
                       SizedBox(
                        height: 10,
                      ),
                  HomePageContainer(
                  width :  width * .96,
                   height : height * .2,
                   color : Colors.white,
                   containerHeading: 'Plot Finder'
                  ),
                       SizedBox(
                        height: 10,
                      ),
                projectsContainer(
                  width :  width * .96,
                   height : height * .28,
                   color : Colors.white,
                   containerHeading: 'Latest Project'
                  ),
                     SizedBox(
                        height: 10,
                      ),
      
                      postAdContainer(
                         width :  width * .96,
                        // height : height * .27,
                      ),
      
      
                       SizedBox(
                        height: 10,
                      ),
      
                  NewsContainer(
                     width :  width * .96,
                   height : height * .32,
                   color : Colors.white,
                   containerHeading: 'News'
                  ),
      
                   SizedBox(
                        height: 10,
                      ),
      
                  
                
                    ],
                  ),
                ) ),
      ),
    );
      
        
  }


      // Custom Widgets
  HomePageContainer({width , height , color , containerHeading}){
   return  Container(      
    width: width,
      height: height,
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
         color: Colors.black45,
      ),

    child: Padding(
       padding: const EdgeInsets.symmetric( horizontal : 12.0 , vertical: 4), 
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(containerHeading , style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white)) ,
              TextButton(onPressed: (){}, child: Text('View All' , style: TextStyle(color : Colors.blue , fontWeight: FontWeight.bold) ,)) 
            ],
          ),

       
        ],
      ),
    ),
    );
  }

  projects({height , width , imageHeight , imageWidth , imageUrl ,  description}){
    return   InkWell(
      onTap: ()=> Get.to(NewsPage(imageUrl: imageUrl)),
      child: Container(
           height: height * .8,
         width: width * .4,
          child: Column(
          children: [
          Container(
          height: imageHeight ,
          width:  imageWidth ,
          child: Image.asset( imageUrl ,fit: BoxFit.cover,) ,),
          SizedBox(height: 6,),
          Text( description , overflow: TextOverflow.ellipsis,
           maxLines: 1,
           softWrap: true 
           ,style:  GoogleFonts.roboto(color: Colors.white , fontSize: 12) )
                    ],
         ),
       ),
    );
    
  }

  projectsContainer({width , height , color , containerHeading}){
      BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());    
   return  ConstrainedBox(
    
    constraints: BoxConstraints(
      maxHeight: double.infinity
    ),
     child: Container(      
        width: width,
        // height: height,
       
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
           color: Colors.black45,
        ),
   
      child: Padding(
         padding: const EdgeInsets.symmetric( horizontal : 12.0 , vertical: 2), 
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(containerHeading , style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white)) ,
                TextButton(onPressed: (){
                  Get.to(NavigationPage());
                  bottomNavigationController.changeIndex(1);
   
                }, child: Text('View All' , style: TextStyle(color : Colors.blue , fontWeight: FontWeight.bold) ,)) 
              ],
            ),
   
            Container(
              
              height: height * .72,
              width: double.infinity,
              color: Color.fromARGB(0, 224, 18, 18),
              child: SingleChildScrollView(
               physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                    SizedBox(width: width * .01,),
                        projects(height: height * 1 ,width: width * 1 , imageHeight: height * .55 ,
                       imageWidth: width * .9 , imageUrl: 'assets/houses/house5.jpg' , description: 'Gulustan-e-Johar, Block 7'),
   
                    SizedBox(width: width * .03,),
                      projects(height: height * 1 ,width: width * 1 , imageHeight: height * .55 ,
                       imageWidth: width * .9 , imageUrl: 'assets/houses/house4.jpg' , description: 'Malir Cantt, Phase 2'),
   
                                          
                     SizedBox(width: width * .03,),
                     projects(height: height * 1 ,width: width * 1 , imageHeight: height * .55 ,
                    imageWidth: width * .9 , imageUrl: 'assets/houses/house3.jpg' , description: 'Gulshan-e-Iqbal, Block 1'),
   
                    SizedBox(width: width * .03,),
                    projects(height: height * 1 ,width: width * 1 , imageHeight: height * .55 ,
                    imageWidth: width * .9 , imageUrl: 'assets/houses/house2.jpg' , description: 'DHA , Phase 6'),
   
                    SizedBox(width: width * .03,),
                   Container(height: height * .6,
                        width: width * .4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
   
                      Container(
                        height: height * .4,
                        width: width * .4,
                        child:   Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                                radius: 45,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_forward_sharp , color: Colors.white),
                                      Text('Read More' , style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                ),
                              ),
                        )),
                      
                    ],
                  ),
                 ),
               ],)),
            )
            
          ],
        ),
      ),
      ),
   );
  }

postAdContainer({width , height , color , containerHeading}){
   return  ConstrainedBox(
    constraints: BoxConstraints(
      maxHeight: double.infinity
    ),
     child: Container(      
      width: width,
      // height: height,
       
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
           color: Colors.black45,
        ),
   
      child: Padding(
         padding: const EdgeInsets.symmetric( horizontal : 12.0 , vertical: 4), 
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Text('Looking to sell or rent your property?' ,textAlign: TextAlign.center , style: GoogleFonts.roboto(fontSize: 18 , fontWeight: FontWeight.w500 , color: Colors.white),),
                SizedBox(height: 8,),
                Center(child: Text("Don't Worry,HumaraGhar is the best place to sell or reach to the tenants.", textAlign: TextAlign.center , style: GoogleFonts.roboto(fontSize: 16 , fontWeight: FontWeight.w400 , color: Colors.white),)),
                SizedBox(height: 8,),
                Text('just post an Ad and reach out to potential buyer or tenants.' , textAlign: TextAlign.center ,style: GoogleFonts.roboto(fontSize: 14 , fontWeight: FontWeight.w300 , color: Colors.white ,  ),),
              SizedBox(height: 8,), 
              RoundButton(title: 'Post An Ad', onTap: (){
                Get.toNamed(RouteName.postAdView);
              }, loading: false)
              
            ],
          ),
        ),
      ),
      ),
   );
  }

  news({height , width , imageHeight , imageWidth , imageUrl ,  description}){
    return   InkWell(
      onTap: ()=> Get.to(NewsPage(imageUrl: imageUrl)),
      child: Container(
           height: height * .68,
         width: width * .4,
          child: Column(
          children: [
          Container(
          height: imageHeight ,
          width:  imageWidth ,
          child: Image.asset( imageUrl ,fit: BoxFit.cover,) ,),
          SizedBox(height: 6,),
          Flexible(child: Text( 
           description ,
           overflow: TextOverflow.ellipsis,
           maxLines: 2,
           softWrap: true,
           style:  GoogleFonts.roboto(color: Colors.white , fontSize: 12) ))
                    ],
         ),
       ),
    );
    
  }
 
  NewsContainer({width , height , color , containerHeading}){
   return  ConstrainedBox(
   
    constraints: BoxConstraints(
      maxHeight: double.infinity
    ),
     child: Container(      
        width: width,
        // height: height,
       
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
           color: Colors.black45,
        ),
   
      child: Padding(
         padding: const EdgeInsets.symmetric( horizontal : 12.0 , vertical: 2), 
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(containerHeading , style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white)) ,
                TextButton(onPressed: (){Get.to(NewsList());}, child: Text('View All' , style: TextStyle(color : Colors.blue , fontWeight: FontWeight.bold) ,)) 
              ],
            ),
   
            Container(
              
              height: height * .75,
              width: double.infinity,
              color: Colors.transparent,
              child: SingleChildScrollView(
               physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                    SizedBox(width: width * .01,),
                        news(height: height * 1 ,width: width * 1 , imageHeight: height * .5 ,
                       imageWidth: width * .9 , imageUrl: 'assets/houses/house2.jpg' , description: 'Premium housing Society Annouces 10 Marala Plots ...'),
   
                    SizedBox(width: width * .03,),
                      news(height: height * 1 ,width: width * 1 , imageHeight: height * .5 ,
                       imageWidth: width * .9 , imageUrl: 'assets/houses/house3.jpg' , description: 'Premium housing Society Annouces 10 Marala Plots ...'),
   
                                          
                     SizedBox(width: width * .03,),
                     news(height: height * 1 ,width: width * 1 , imageHeight: height * .5 ,
                    imageWidth: width * .9 , imageUrl: 'assets/houses/house4.jpg' , description: 'Premium housing Society Annouces 10 Marala Plots ...'),
   
                    SizedBox(width: width * .03,),
                    news(height: height * 1 ,width: width * 1 , imageHeight: height * .5 ,
                    imageWidth: width * .9 , imageUrl: 'assets/houses/house5.jpg' , description: 'Premium housing Society Annouces 10 Marala Plots ...'),
   
                    SizedBox(width: width * .03,),
                   Container(height: height * .6,
                        width: width * .4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
   
                      Container(
                        height: height * .4,
                        width: width * .4,
                        child:   Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                                radius: 45,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_forward_sharp , color: Colors.white),
                                      Text('Read More' , style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                ),
                              ),
                        )),
                      
                    ],
                  ),
                 ),
               ],)),
            )
            
          ],
        ),
      ),
      ),
   );
  }

                    // Browse Properties Section
  propertiesContainer({width , height , color , containerHeading , tabController , BuildContext? context}){
  BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());    
   return  Container(      
    width: width ,
      height: height * .6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
         color: Colors.black45,
      ),
       child: Padding(
      padding: const EdgeInsets.symmetric( horizontal : 12.0 , vertical: 2), 
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(containerHeading , style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white)) ,
              TextButton(onPressed: (){
                Get.to(NavigationPage());
                bottomNavigationController.changeIndex(2);
              }, child: Text('Search' , style: TextStyle(color : Colors.blue , fontWeight: FontWeight.bold) ,)) 
            ],
          ),
          TabBar(       
             controller: tabController,
                  isScrollable: true,
                  indicatorColor: Colors.green,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: EdgeInsets.symmetric(horizontal: 18),
                  dividerColor: Colors.transparent,
                  tabs: [
                  Tab(child: Text('Homes' , style: GoogleFonts.roboto(color: Colors.white ,fontSize: 18),),),
                  Tab(child: Text('Plots' , style: GoogleFonts.roboto(color: Colors.white,fontSize: 18 ),),),
                  Tab(child: Text('Commercial' , style: GoogleFonts.roboto(color: Colors.white,fontSize: 18 ),),),
          ]),
          SizedBox(height: 4,),
          Expanded(
            child: TabBarView(
                      controller: tabController,
              children: [

                  homeTabContainer(height: height  , width:  width),
                  plotTabContainer(height: height , width:  width),
                  commericialTabContainer(height: height , width:  width)
          
         
            ]))
            
            ]),
              ),
             
       
      );
    


  }

  Widget homeTabContainer({height , width}){
    BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());    
    return  Container(decoration: BoxDecoration(
                //  color: const Color.fromARGB(41, 33, 149, 243), 
                borderRadius: BorderRadius.circular(12),
              ),
              child : Column(
                  children: [
              //  SizedBox(
              // height: 40,
              // child: ListView.builder(
              // scrollDirection: Axis.horizontal,
              // itemCount: homeCategoriesList.length,
              // itemBuilder: (context , index){
              // return InkWell(
              //   onTap: (){
              //     setState(() {
              //     homeTabName = homeCategoriesList[index];
              //     });
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(right : 8.0),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //       color: homeTabName == homeCategoriesList[index] ?  Color.fromARGB(255, 8, 58, 139) : Colors.transparent ,
              //       ),
                    
              //       child: Center(
              //         child: Padding(
              //           padding: const EdgeInsets.symmetric(horizontal : 16.0),
              //           child: Text(homeCategoriesList[index].toString(), 
              //           style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
              //           ),
              //         ),
              //       ) ,
              //     ),
              //   ),
              // );
              // }),
              // )
              Padding(
                 padding: const EdgeInsets.only(top : 8.0 , left:  8.0 , right:   8.0) ,
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     insideTabContainer(height: height , width: width , title: 'Houses' ,  
                     onTap: (){
                      Get.to(NavigationPage(),  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);}  ),
                     insideTabContainer(height: height , width: width , title: 'Flats'  ,  
                     onTap: (){
                      Get.to(NavigationPage(),  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);}  ),
                     insideTabContainer(height: height , width: width , title: 'Upper Portion'  ,  
                     onTap: (){
                      Get.to(NavigationPage(),  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);}  ),
                   ],
                 ),
               ),

              Padding(
                 padding: const EdgeInsets.only(top : 8.0 , left:  8.0 , right:   8.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     insideTabContainer(height: height , width: width , title: 'Upper Portion'  ,  
                     onTap: (){
                      Get.to(NavigationPage(),  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);}  ),
                     insideTabContainer(height: height , width: width , title: 'Farmhouse'  ,  
                     onTap: (){
                      Get.to(NavigationPage(),  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);} ),
                     insideTabContainer(height: height , width: width , title: 'Penthouse'  ,  
                     onTap: (){
                      Get.to(NavigationPage(),  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);} ),                   ],
                 ),
               ),
              
              ]));}

  Widget plotTabContainer({height , width}){
      BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());    
    return  Container(decoration: BoxDecoration(
                //  color: Color.fromARGB(122, 33, 149, 243), 
                borderRadius: BorderRadius.circular(12),
              ),
              child : Column(
                  children: [
                    // SizedBox(height: 10,),
              //  SizedBox(
              // height: 40,
              // child: ListView.builder(
              // scrollDirection: Axis.horizontal,
              // itemCount: plotsCategoriesList.length,
              // itemBuilder: (context , index){
              // return InkWell(
              //   onTap: (){
                  
              //     setState(() {
              //       plotsTabName = plotsCategoriesList[index];
              //     });
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(right : 8.0),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //       color: plotsTabName == plotsCategoriesList[index] ?  Color.fromARGB(255, 8, 58, 139) : Colors.transparent ,
              //       ),
                    
              //       child: Center(
              //         child: Padding(
              //           padding: const EdgeInsets.symmetric(horizontal : 16.0),
              //           child: Text(plotsCategoriesList[index].toString(), 
              //           style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
              //           ),
              //         ),
              //       ) ,
              //     ),
              //   ),
              // );
              // }),
                  // )
                   Padding(
                 padding: const  EdgeInsets.all(8.0) ,
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     insideTabContainer(height: height , width: width , title: 'Residential Plot'  ,  
                     onTap: (){
                      Get.to(NavigationPage(),  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);}  ),
                     insideTabContainer(height: height , width: width , title: 'Commercial Plot' ,  
                     onTap: (){
                      Get.to(NavigationPage(),  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);}  ),
                     insideTabContainer(height: height , width: width , title: 'Plot File' ,  
                     onTap: (){
                      Get.to(NavigationPage(),  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);}  ),
                   ],
                 ),
               ),

              Padding(
                 padding: const EdgeInsets.only(top : 8.0 , left:  8.0 , right:   8.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     insideTabContainer(height: height , width: width , title: 'Plot Form' ,  
                     onTap: (){
                      Get.to(NavigationPage(),  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);}  ),
                     insideTabContainer(height: height , width: width , title: 'Agriculture Land' ,  
                     onTap: (){
                      Get.to(NavigationPage(),  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);}  ),
                     insideTabContainer(height: height , width: width , title: 'Industrial Land' ,  
                     onTap: (){
                      Get.to(NavigationPage(),  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);}  ),                   ],
                 ),
               ),
               ]));
      
  }

  Widget commericialTabContainer({height , width}){
      BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());    
    return  Container(decoration: BoxDecoration(
                //  color: Color.fromARGB(119, 124, 57, 18), 
                borderRadius: BorderRadius.circular(12),
              ),
              child : Column(
                  children: [
                    // SizedBox(height: 10,),
              //  SizedBox(
              // height: 40,
              // child: ListView.builder(
              // scrollDirection: Axis.horizontal,
              // itemCount: commercialCategoriesList.length,
              // itemBuilder: (context , index){
              // return InkWell(
              //   onTap: (){
                  
              //     setState(() {
              //       commercialTabName = commercialCategoriesList[index];
              //     });
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(right : 8.0),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //       color: commercialTabName == commercialCategoriesList[index] ?  Color.fromARGB(255, 8, 58, 139) : Colors.transparent ,
              //       ),
                    
              //       child: Center(
              //         child: Padding(
              //           padding: const EdgeInsets.symmetric(horizontal : 16.0),
              //           child: Text(commercialCategoriesList[index].toString(), 
              //           style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
              //           ),
              //         ),
              //       ) ,
              //     ),
              //   ),
              // );
              // }),
              //  ), 
            Padding(
                 padding: const EdgeInsets.all(8.0)  ,
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     insideTabContainer(height: height , width: width , title: 'Office' ,  
                     onTap: (){
                      Get.to(NavigationPage(),  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);}  ),
                     insideTabContainer(height: height , width: width , title: 'Shop'  ,  
                     onTap: (){
                      Get.to(NavigationPage(),  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);}  ),
                     insideTabContainer(height: height , width: width , title: 'Building' ,  
                     onTap: (){
                      Get.to(NavigationPage(),  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);}  ),
                   ],
                 ),
               ),

              Padding(
                 padding: const EdgeInsets.only(top : 8.0 , left:  8.0 , right:   8.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     insideTabContainer(height: height , width: width , title: 'Wearhouse' ,  
                     onTap: (){
                      Get.to(NavigationPage() ,  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);}  ),
                     insideTabContainer(height: height , width: width , title: 'Factory' ,  
                     onTap: (){
                      Get.to(NavigationPage(),  transition: Transition.fadeIn);
                      bottomNavigationController.changeIndex(1);}  ),
                     insideTabContainer(height: height , width: width , title: 'Other' ,  
                     onTap: (){
                      Get.to(NavigationPage() ,  transition: Transition.fadeIn );
                      bottomNavigationController.changeIndex(1);}  ),                   ],
                 ),
               ),
              
                
               ]));
      
  }

  InkWell insideTabContainer( {height, width , title , VoidCallback? onTap} ) {
    return InkWell(
                    onTap: onTap,
                     child: Container(
                       height:height * .12,
                       width: width * .26,
                       child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(title , textAlign: TextAlign.center ,style: GoogleFonts.roboto(fontSize: 14 , color: Colors.white , fontWeight: FontWeight.w400),),
                         
                        ]),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(159, 33, 149, 243),
                      //  color: const Color.fromARGB(255, 15, 116, 198),
                        borderRadius: BorderRadius.circular(5)
                      ),
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
}


}
  

}

