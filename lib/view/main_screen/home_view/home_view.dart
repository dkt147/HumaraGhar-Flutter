import 'package:HumaraGhar/API/Ads%20Api/post_ad/post_ad_view_test.dart';
import 'package:HumaraGhar/API/BrowseProperties/service.dart';
import 'package:HumaraGhar/API/News/service.dart';
import 'package:HumaraGhar/components/CustomAnimatedToggleButton.dart';
import 'package:HumaraGhar/components/round_button.dart';
import 'package:HumaraGhar/constants/text_styles.dart';
import 'package:HumaraGhar/model/news_model.dart';
import 'package:HumaraGhar/notifications/notifications_services.dart';
import 'package:HumaraGhar/utils/Navigation_Drawer/navigation_drawer.dart';
import 'package:HumaraGhar/constants/background_container.dart';
import 'package:HumaraGhar/view-model/navbar_controller/navbar_controller.dart';
import 'package:HumaraGhar/view/main_screen/blogs/news.dart';
import 'package:HumaraGhar/view/main_screen/blogs/news_list.dart';
import 'package:HumaraGhar/view/main_screen/home_view/carousel.dart';
import 'package:HumaraGhar/view/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../API/GetSingleProperty/get_single_property_view.dart';
import '../../../API/latest_projects/latesProjectDetailView.dart';
import '../../../API/latest_projects/latest_properties_all_view.dart';
import '../../../API/latest_projects/model.dart';
import '../../../API/latest_projects/service.dart';

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
    late TabController tabController = TabController(length: 3, vsync: this);
    late BottomNavigationController bottomNavigationController =
        Get.put(BottomNavigationController());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        return onPop();
      },
      child: BackgroundContainer(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            drawer: SideNavigationDrawer(),
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Color.fromARGB(255, 172, 211, 206),
              ),
              title: Text('Home'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Want to',
                          style: primaryWhiteTextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600)
                          //  GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 22, color : Colors.white),
                          ),
                      SizedBox(width: 12),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ToggleButton(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: () {
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
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                size: 22,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Flexible(
                                  child: Text(
                                'Search for plots , homes , shops , offices',
                                overflow: TextOverflow.ellipsis,
                                style:
                                    GoogleFonts.robotoFlex(color: Colors.grey),
                              ))
                            ],
                          )),
                    ),
                  ),

                  HomeCarousel(),

                  // browse property
                  propertiesContainer(
                      width: width * .96,
                      height: height * .54,
                      color: Colors.white,
                      containerHeading: 'Browse Properties',
                      tabController: tabController),

                  // plot finder
                  // HomePageContainer(
                  // width :  width * .96,
                  //  height : height * .2,
                  //  color : Colors.white,
                  //  containerHeading: 'Plot Finder'
                  // ),
                  SizedBox(
                    height: 10,
                  ),

                  projectsContainer(
                      width: width * .96,
                      height: height * .28,
                      color: Colors.white,
                      containerHeading: 'Latest Project'),
                  SizedBox(
                    height: 10,
                  ),

                  postAdContainer(
                    width: width * .96,
                    // height : height * .27,
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  NewsContainer(
                      width: width * .96,
                      height: height * .32,
                      color: Colors.white,
                      containerHeading: 'News'),

                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
      ),
    );
  }

  // Custom Widgets
  HomePageContainer({width, height, color, containerHeading}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black45,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(containerHeading , style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white)) ,
                Text(containerHeading,
                    style: primaryWhiteTextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold)),
                // TextButton(onPressed: (){}, child: Text('View All' , style: TextStyle(color : Colors.blue , fontWeight: FontWeight.bold) ,))
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: primaryBlueTextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  projects(
      {height,
      width,
      imageHeight,
      imageWidth,
      imageUrl,
      description,
      propertyId}) {
    return InkWell(
      onTap: () => Get.to(GetSinglePropertyView(
        propertyId: propertyId,
      )),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          height: height * .8,
          width: width * .4,
          child: Column(
            children: [
              Container(
                height: imageHeight,
                width: imageWidth,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons
                        .error); // Display error icon if image loading fails
                  },
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: true
                  //  ,style:  GoogleFonts.roboto(color: Colors.white , fontSize: 12) )
                  ,
                  style: primaryWhiteTextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500))
            ],
          ),
        ),
      ),
    );
  }

  // Latest Projects Main Container
  projectsContainer({width, height, color, containerHeading}) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: double.infinity),
      child: Container(
        width: width,
        // height: height,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black45,
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text(containerHeading , style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white)) ,
                  Text(containerHeading,
                      style: primaryWhiteTextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {
                        Get.to(LatestProjectsAllView());

                        // }, child: Text('View All' , style: TextStyle(color : Colors.blue , fontWeight: FontWeight.bold) ,))
                      },
                      child: Text(
                        'View All',
                        style: primaryBlueTextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              Container(
                  height: height * .72,
                  width: double.infinity,
                  color: Color.fromARGB(0, 224, 18, 18),
                  child: FutureBuilder<LatestProjectModel>(
                    future: LatestProjectServices().fetchLatestProjects(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else if (snapshot.hasData) {
                        List<Project>? latestProject = snapshot.data!.response;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            var property = latestProject![index];
                            return InkWell(
                              onTap: () {
                                Get.to(latesProjectDetailView(
                                    projectDetails: latestProject[index]));
                              },
                              child: projects(
                                  height: height * 1,
                                  width: width * 1,
                                  imageHeight: height * .55,
                                  imageWidth: width * .9,
                                  imageUrl: property.attachmentUrl,
                                  description: property.name,
                                  propertyId: property.propertyId),
                            );
                          },
                        );
                      } else {
                        return Text('No Data');
                      }
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }

/*
  projects({height , width , imageHeight , imageWidth , imageUrl ,  description , onTapNews}){
    return   InkWell(
      onTap: ()=> Get.to(NewsPage(newsDetails:  onTapNews  )),
      child: Padding(
        padding: const EdgeInsets.only(right :  8.0),
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
      ),
    );
    
  }
        // Latest Projects Main Container
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
              child: FutureBuilder<LatestProjectModel>(
                        future: LatestProjectServices().fetchLatestProjects(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          } else if (snapshot.hasData) {
                              return Text('Data loaded successfully');
              //               List<Projects>? latestProject = snapshot.data!.projects;
              //               return ListView.builder(
              //                 scrollDirection: Axis.horizontal,
                              
              // itemCount: latestProject!.length,
              // itemBuilder: (context, index) {
              //   return  projects(height: height * 1 ,width: width * 1 , imageHeight: height * .55 ,
              // imageWidth: width * .9 , imageUrl: 'assets/houses/house5.jpg' , description: latestProject[index].name) ;
                
              //   // ListTile(
              //   //   title: Text(latestProject[index].name.toString()),
              //   //   subtitle: Text(latestProject[index].price.toString()),
              //   // );
              // },
              
              //               );
                          } else {
                            return Text('No Data');
                          }
                        },
                      ),
            )
            
          ],
        ),
      ),
      ),
   );
  }
*/
  postAdContainer({width, height, color, containerHeading}) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: double.infinity),
      child: Container(
        width: width,
        // height: height,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black45,
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text('Looking to sell or rent your property?' ,textAlign: TextAlign.center , style: GoogleFonts.roboto(fontSize: 18 , fontWeight: FontWeight.w500 , color: Colors.white),),
                Text('Looking to sell or rent your property?',
                    textAlign: TextAlign.center,
                    style: primaryWhiteTextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 8,
                ),
                // Center(child: Text("Don't Worry,HumaraGhar is the best place to sell or reach to the tenants.", textAlign: TextAlign.center , style: GoogleFonts.roboto(fontSize: 16 , fontWeight: FontWeight.w400 , color: Colors.white),)),
                Center(
                    child: Text(
                        "Don't Worry,HumaraGhar is the best place to sell or reach to the tenants.",
                        textAlign: TextAlign.center,
                        style: primaryWhiteTextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))),
                SizedBox(
                  height: 8,
                ),
                // Text('just post an Ad and reach out to potential buyer or tenants.' , textAlign: TextAlign.center ,style: GoogleFonts.roboto(fontSize: 14 , fontWeight: FontWeight.w300 , color: Colors.white ,  ),),
                Text(
                  'just post an Ad and reach out to potential buyer or tenants.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                RoundButton(
                    title: 'Post An Ad',
                    onTap: () {
                      // Get.toNamed(RouteName.postAdView);
                      Get.to(PostAdViewTest());
                    },
                    loading: false)
              ],
            ),
          ),
        ),
      ),
    );
  }

  newsInside(
      {height,
      width,
      imageHeight,
      imageWidth,
      imageUrl,
      description,
      onTapNews}) {
    return InkWell(
      onTap: () => Get.to(NewsPage(
        newsDetails: onTapNews,
      )),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          height: height * .68,
          width: width * .4,
          child: Column(
            children: [
              Container(
                height: imageHeight,
                width: imageWidth,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons
                        .error); // Display error icon if image loading fails
                  },
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Flexible(
                  child: Text(description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                      //  style:  GoogleFonts.roboto(color: Colors.white , fontSize: 12) ))
                      style: primaryWhiteTextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500)))
            ],
          ),
        ),
      ),
    );
  }

  NewsContainer({width, height, color, containerHeading}) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: double.infinity),
      child: Container(
        width: width,
        // height: height,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black45,
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text(containerHeading , style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white)) ,
                  Text(containerHeading,
                      style: primaryWhiteTextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                  // TextButton(onPressed: (){Get.to(NewsList());}, child: Text('View All' , style: TextStyle(color : Colors.blue , fontWeight: FontWeight.bold) ,))
                  TextButton(
                      onPressed: () {
                        Get.to(NewsList());
                      },
                      child: Text(
                        'View All',
                        style: primaryBlueTextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              Container(
                  height: height * .75,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: FutureBuilder<NewsModel>(
                      future: NewsServices().fetchNews(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        } else if (snapshot.hasData) {
                          List<News>? news = snapshot.data!.news;
                          return
                              // Text('News Loaded successfully\n but list is empty') ;
                              ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: news!.length,
                            itemBuilder: (context, index) {
                              return newsInside(
                                  height: height * 1,
                                  width: width * 1,
                                  imageHeight: height * .5,
                                  imageWidth: width * .9,
                                  imageUrl: news[index].image,
                                  description: news[index].title,
                                  onTapNews: news[index]);
                            },
                          );
                        } else {
                          return Text('No Data');
                        }
                      }))
            ],
          ),
        ),
      ),
    );
  }

  // Browse Properties Section
  propertiesContainer(
      {width,
      height,
      color,
      containerHeading,
      tabController,
      BuildContext? context}) {
    BottomNavigationController bottomNavigationController =
        Get.put(BottomNavigationController());
    return Container(
      width: width,
      height: height * .6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black45,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(containerHeading,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
              TextButton(
                  onPressed: () {
                    Get.to(NavigationPage());
                    bottomNavigationController.changeIndex(2);
                  },
                  child: Text(
                    'Search',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          TabBar(
              controller: tabController,
              isScrollable: false,
              indicatorColor: Colors.green,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.symmetric(horizontal: 8),
              dividerColor: Colors.transparent,
              tabs: [
                // Tab(child: Text('Homes' , style: GoogleFonts.roboto(color: Colors.white ,fontSize: 18),),),
                Tab(
                  child: Text('Homes',
                      style: primaryWhiteTextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                ),
                Tab(
                  child: Text(
                    'Plots',
                    style: primaryWhiteTextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Tab(
                  child: Text(
                    'Commercial',
                    style: primaryWhiteTextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ]),
          SizedBox(
            height: 4,
          ),
          Expanded(
              child: TabBarView(controller: tabController, children: [
            homeTabContainer(height: height, width: width),
            plotTabContainer(height: height, width: width),
            commericialTabContainer(height: height, width: width)
          ]))
        ]),
      ),
    );
  }

  Widget homeTabContainer({height, width}) {
    BottomNavigationController bottomNavigationController =
        Get.put(BottomNavigationController());
    return Container(
        decoration: BoxDecoration(
          //  color: const Color.fromARGB(41, 33, 149, 243),
          borderRadius: BorderRadius.circular(12),
        ),
        child: FutureBuilder(
          future: BrowsePropertyServices().browseProperty(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              // List<PropertyCategory>? houseProject = snapshot.data!.data!.house;
              List<dynamic>? houseProject = snapshot.data!.data!.house;
              return GridView.builder(
                  padding: EdgeInsets.only(top: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4.0,
                      childAspectRatio: (1 / .5),
                      mainAxisSpacing: 4.0),
                  itemCount: houseProject!.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return insideTabContainer(
                        height: height * .02,
                        width: width,
                        title: houseProject[index].name,
                        onTap: () {
                          Get.to(NavigationPage(),
                              transition: Transition.fadeIn);
                          bottomNavigationController.changeIndex(1);
                        });
                  });
            } else {
              return Text('No Data');
            }
          },
        ));
  }

  Widget plotTabContainer({height, width}) {
    BottomNavigationController bottomNavigationController =
        Get.put(BottomNavigationController());
    return Container(
        decoration: BoxDecoration(
          //  color: const Color.fromARGB(41, 33, 149, 243),
          borderRadius: BorderRadius.circular(12),
        ),
        child: FutureBuilder(
          future: BrowsePropertyServices().browseProperty(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              // List<PropertyCategory>? plotProject = snapshot.data!.data!.plot;
              List<dynamic>? plotProject = snapshot.data!.data!.plot;
              return GridView.builder(
                  padding: EdgeInsets.only(top: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4.0,
                      childAspectRatio: (1 / .5),
                      mainAxisSpacing: 4.0),
                  itemCount: plotProject!.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return insideTabContainer(
                        height: height * .02,
                        width: width,
                        title: plotProject[index].name,
                        onTap: () {
                          Get.to(NavigationPage(),
                              transition: Transition.fadeIn);
                          bottomNavigationController.changeIndex(1);
                        });
                  });
            } else {
              return Text('No Data');
            }
          },
        ));
  }

  Widget commericialTabContainer({height, width}) {
    BottomNavigationController bottomNavigationController =
        Get.put(BottomNavigationController());
    return Container(
        decoration: BoxDecoration(
          //  color: const Color.fromARGB(41, 33, 149, 243),
          borderRadius: BorderRadius.circular(12),
        ),
        child: FutureBuilder(
          future: BrowsePropertyServices().browseProperty(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              // List<PropertyCategory>? commercialProject = snapshot.data!.data!.commercial;
              List<dynamic>? commercialProject =
                  snapshot.data!.data!.commercial;
              return GridView.builder(
                  padding: EdgeInsets.only(top: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4.0,
                      childAspectRatio: (1 / .5),
                      mainAxisSpacing: 4.0),
                  itemCount: commercialProject!.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return insideTabContainer(
                        height: height * .02,
                        width: width,
                        title: commercialProject[index].name,
                        onTap: () {
                          Get.to(NavigationPage(),
                              transition: Transition.fadeIn);
                          bottomNavigationController.changeIndex(1);
                        });
                  });
            } else {
              return Text('No Data');
            }
          },
        ));
  }

  InkWell insideTabContainer({height, width, title, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * .12,
        width: width * .26,
        child: Center(
            child:
                //  Text(title , textAlign: TextAlign.center ,style: GoogleFonts.roboto(fontSize: 14 , color: Colors.white , fontWeight: FontWeight.w400),)),
                Text(
          title,
          textAlign: TextAlign.center,
          style:
              primaryWhiteTextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        )),
        decoration: BoxDecoration(
            color: Color.fromARGB(159, 33, 149, 243),
            //  color: const Color.fromARGB(255, 15, 116, 198),
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }

  onPop() {
    BottomNavigationController bottomNavigationController =
        Get.put(BottomNavigationController());

    if (bottomNavigationController.selectdIndex != 0) {
      Get.to(NavigationPage());
      bottomNavigationController.changeIndex(0);
    } else {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }
}
