
// import 'package:HumaraGhar/main.dart';
import 'package:HumaraGhar/model/banner_model.dart';
import 'package:HumaraGhar/API/Banner/service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeCarousel extends StatelessWidget {
  
  HomeCarousel({super.key});

List imageList = [
   { 'image_path' : 'assets/houses/house2.jpg' },
   { 'image_path' : 'assets/houses/house3.jpg' },
   { 'image_path' : 'assets/houses/house4.jpg' },
   { 'image_path' : 'assets/houses/house5.jpg' }
];

  @override
  Widget build(BuildContext context) {
    return 
    // CarouselSlider(
    //   items: imageList.map((item) => Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: ClipRRect(
    //       borderRadius: BorderRadius.circular(18),
    //       child: FutureBuilder<BannerModel>(
    //                 future: HomeServices().fetchBannerImages(),
    //                 builder: (context, snapshot) {
    //        if (snapshot.connectionState == ConnectionState.waiting) {
    //          return Center(child: CircularProgressIndicator());
    //        } else if (snapshot.hasError) {
    //          return Text("${snapshot.error}");
    //        } else if (snapshot.hasData) {
    //          List<Banners>? banners = snapshot.data!.banners;
    //          return ListView.builder(
    //           // scrollDirection: Axis.horizontal,
    //            itemCount: banners!.length,
    //            itemBuilder: (context, index) {
    //              return 
    //              // Image.network(banners[index].url ?? '');
    //             Container(
    //               child: CachedNetworkImage(
                    
    //                 imageUrl: banners[index].url ?? '', fit: BoxFit.cover,  width: double.infinity, 
    //                                 placeholder: (BuildContext context, String url) => const CircularProgressIndicator(),
    //                   errorWidget: (BuildContext context, String url, dynamic error) => const Icon(Icons.error),
                   
    //                 ),
    //             );
           
    //            },
    //          );
    //        } else {
    //          return Text('No Data');
    //        }
    //                 },
    //               ),
    //     ),
      
    //   ) ).toList(), 
    //   options: CarouselOptions(
    //         height: 200,
    //   aspectRatio: 16/9,
    //   viewportFraction: 0.9,
    //   initialPage: 0,
    //   enableInfiniteScroll: true,
    //   reverse: false,
    //     autoPlay: true,
    //   autoPlayInterval: Duration(seconds: 8),
    //   autoPlayAnimationDuration: Duration(milliseconds: 2500),
    //   pauseAutoPlayOnTouch: true,
    //   autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
    //     scrollDirection: Axis.horizontal,
    //   ));
  
Container(
  height: MediaQuery.of(context).size.height * .25  ,
  width: MediaQuery.of(context).size.width,
  child: FutureBuilder<BannerModel>(
    future: HomeServices().fetchBannerImages(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      } else if (snapshot.hasData) {
        List<Banners>? banners = snapshot.data!.banners;
        return CarouselSlider(
          items: banners!.map((banner) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                width: MediaQuery.of(context).size.width, // Set container width to screen width
                child: CachedNetworkImage(
                  imageUrl: banner.url ?? '',
                  fit: BoxFit.cover,
                  placeholder: (BuildContext context, String url) =>
                      Center(child: const CircularProgressIndicator()),
                  errorWidget: (BuildContext context, String url, dynamic error) =>
                      const Icon(Icons.error),
                ),
              ),
            ),
          )).toList(),
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16 / 9,
            viewportFraction: 0.9,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 8),
            autoPlayAnimationDuration: Duration(milliseconds: 2500),
            pauseAutoPlayOnTouch: true,
            autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
            scrollDirection: Axis.horizontal,
          ),
        );
      } else {
        return Text('No Data');
      }
    },
  ),
);
}}