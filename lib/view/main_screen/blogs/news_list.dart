import 'package:HumaraGhar/constants/app_colors.dart';
import 'package:HumaraGhar/model/news_model.dart';
import 'package:HumaraGhar/API/News/service.dart';
import 'package:HumaraGhar/constants/background_container.dart';
import 'package:HumaraGhar/view/main_screen/blogs/news.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return BackgroundContainer(
      child: Scaffold(
          appBar: AppBar(
            title :  Text('News'),
       ),

       body:
       FutureBuilder(future: NewsServices().fetchNews(), 
       builder: (context , snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List<News>? news = snapshot.data!.news;
              return ListView.builder(
                itemCount: news!.length,
                itemBuilder: (context, index){
                return newListContainers(
                  height: height , 
                  width: width , 
                  imageUrl: news[index].image, 
                  newsTitle: news[index].title , 
                  newsDescription: news[index].content![index].body,
                   onTapNews: news[index]
                
                );

              }
              );
       }else{
        return Center(child: Text('No Data'),);
       }
       }
       
       
       )));
  }

  newListContainers({height , width , imageUrl  , newsTitle , newsDescription , onTapNews}){
    return  InkWell(
      onTap: (){Get.to(NewsPage(newsDetails: onTapNews));} ,
      child: Card(
        
        color: Colors.transparent,
            
                    child: Container(
                      // height: height * .5,
                      width: width ,
                      child: Column(children: [
                        Container(
                          height: height * .3,
                          width: width,
                          color: const Color.fromARGB(255, 255, 254, 252),
                          child: Image.network(imageUrl , fit: BoxFit.cover,),
                          ),
                          ConstrainedBox(
                              
                            constraints: BoxConstraints(
                            maxHeight: double.infinity),
                            
                            child: Container(
                              // height: height * .2,
                              color: Colors.transparent,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal : 8.0),
                                child: Column(
                                  children: [
                                    SizedBox(height : 12),
                                    Text(newsTitle , style: GoogleFonts.poppins(color : AppColors.primaryWhiteColor , fontSize: 20 , fontWeight: FontWeight.w500),),
                                    SizedBox(height : 8),
                                    Text(newsDescription , style: GoogleFonts.poppins(color: Color.fromARGB(255, 0, 0, 0) , fontSize: 16), )
                                    
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ]),
                    ),
                  ),
    );
              // );
  }
}