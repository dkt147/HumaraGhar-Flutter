
import 'package:HumaraGhar/view-model/project_controller/project_page_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProjectsImageSlider extends StatefulWidget {
  // final String imageUrl;  
  final String imagePath;
  final int imageCount;
  const ProjectsImageSlider({
    Key? key, required this.imagePath, required this.imageCount,
    // required this.imageUrl,
  }) : super(key: key);

  @override
  State<ProjectsImageSlider> createState() => _ProjectsImageSliderState();
}

class _ProjectsImageSliderState extends State<ProjectsImageSlider> {

  
  // List imageList = [
  //   {"id" : 1 , "image_path"  :'assets/houses/house2.jpg' },
  //   {"id" : 1 , "image_path"  :'assets/houses/house4.jpg' },
  //   {"id" : 1 , "image_path"  :'assets/houses/house6.jpg' },
  // ];

  // final displayImage =  widget.imageUrl ;

  final CarouselController carouselController = CarouselController();
  final ProjectController projectController = Get.put(ProjectController());
  int currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children  : [
              // CarouselSlider(
              //   // run a loop through map and extract image path
              //   items: imageList.map(
              //     (item) => Image.asset(item['image_path'],
              //     fit: BoxFit.cover,
              //     width: double.infinity,
              //     ) ).toList()   ,
              //  options: CarouselOptions(
              //   autoPlay: false,
              //   aspectRatio: 2,
              //   height: height * .35 ,
              //   viewportFraction: 1,
              //   onPageChanged: (index , reason){
              //     setState(() {
              //       currentIndex = index;
              //     });
              //   }
              // )),
              Obx(() => CarouselSlider.builder(
                itemCount: widget.imageCount,
                itemBuilder: (context, index, realIndex) {
                  final imagePath = widget.imagePath;
    
                  return buildImage(imageUrl: imagePath, Index: projectController.imageList.length, height: height);
                },
                options:
                 CarouselOptions(
                autoPlay: false,
                aspectRatio: 2,
                height: height * .35 ,
                viewportFraction: 1,
                onPageChanged: (index , reason){
                  projectController.changeCurrentIndex(index);
                  
                  // setState(() {
                  //   currentIndex = index;
                  // });
                }
              )),),
              Positioned(
                bottom: 10,
                left : 0 , 
                right : 0,
               child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   buildIndicator(),
                 ],
               ),
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //       // asMap provide id in key value pair keyValue pair
                    
    
                  // ],
                ),
              
    
              ]),
              
        ],
      ),
    );
  }
  Widget buildIndicator(){
    return Obx(() => AnimatedSmoothIndicator(
      activeIndex: projectController.currentIndex.value,
      count: projectController.imageList.length,
      effect: ScrollingDotsEffect(
        dotWidth: 8,
        dotHeight: 8,
        activeDotColor: Color.fromARGB(255, 19, 133, 44),
        dotColor: Colors.white
      ),
      )
);  }

  Widget buildImage({required dynamic imageUrl ,required int Index ,required double height}){
    return Container(
      width: double . infinity,
      height: height * .35,
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
      ),
      
    );
  }
}