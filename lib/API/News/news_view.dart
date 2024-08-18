
import 'package:HumaraGhar/model/news_model.dart';
import 'package:HumaraGhar/API/News/service.dart';
import 'package:HumaraGhar/view-model/navbar_controller/navbar_controller.dart';
import 'package:HumaraGhar/view/main_screen/blogs/news.dart';
import 'package:HumaraGhar/view/main_screen/blogs/news_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';


class NewsView extends StatefulWidget {
  const NewsView({Key? key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
          late BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());    
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: 
                  NewsContainer(
                     width :  width * .96,
                   height : height * .32,
                   color : Colors.white,
                   containerHeading: 'News'
                  ),
  
      ),
    );
  }

  Widget container(){
    return Container();
  }
  Widget  newsInside({height , width , imageHeight , imageWidth , required imageUrl ,  description , onTapNews}){
    return   InkWell(
      onTap: ()=> Get.to(NewsPage(newsDetails: onTapNews,)),
      child: Container(
           height: height * .68,
         width: width * .4,
          child: Column(
          children: [
          Container(
          height: imageHeight ,
          width:  imageWidth ,
          child: Image.network( imageUrl ,fit: BoxFit.cover,) ,),
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
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
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
              child: 
                 FutureBuilder<NewsModel>(
          future: NewsServices().fetchNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
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
                  return newsInside(height: height * 1 ,width: width * 1 , imageHeight: height * .5 ,
                       imageWidth: width * .9 ,
                        imageUrl: news[index].image.toString() ,
                         description: news[index].title .toString(),
                         onTapNews: news[index]
                         );
   
           
                },
              );
            } else {
              return Text('No Data');
          
      
                  }
               
                })
                
            
            )
            
        ]),
        ),
      ),
      );
   
  }


}