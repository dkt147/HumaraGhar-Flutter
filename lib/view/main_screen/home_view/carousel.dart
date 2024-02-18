
// import 'package:HumaraGhar/main.dart';
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
    return CarouselSlider(
      items: imageList.map((item) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(262)
          ),
          child: ClipRRect(
            borderRadius : BorderRadius.circular(18),
            child: Image.asset( item['image_path'] , fit: BoxFit.cover,  width: double.infinity,))),
      ) ).toList(), 
      options: CarouselOptions(
            height: 200,
      aspectRatio: 16/9,
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
      ));
  }
}