// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:HumaraGhar/utils/background_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsPage extends StatefulWidget {
  final String imageUrl;  
  const NewsPage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return BackgroundContainer(
      child: Scaffold(
        
      
        body : SafeArea(
          child: SingleChildScrollView(
            child: Column(
                  
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                SizedBox(height: height * .002,),
                Padding(
                  padding: EdgeInsets.only(left: width * .05 , top: height * .01),
                  child: InkWell(
               onTap: (){Get.back();},
                    child: CircleAvatar(
                      backgroundColor:Color.fromARGB(193, 14, 50, 98),
                      radius: height * .02,
                      child: Center(child: SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(left : 8.0),
                          child: Icon(Icons.arrow_back_ios , color: Colors.white),
                        ))),
                    ),
                  ),
                ),
                SizedBox(height: height * .01,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal :  2),
                  child: Container(
                    width: width * .99,
                    
                    height:height *  .4  ,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      ),
                      child: Image.asset(widget.imageUrl , fit: BoxFit.cover,),
                    ),
                    
                ),
               SizedBox(height: height * .02,),
                  Padding(
                    padding: const EdgeInsets.symmetric( horizontal :12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('The Pride of Himalaya: Nanga Parbat' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize: 20) ,),
                    SizedBox(height: height * .01,),
                    Text('''Nanga Parbat, the ninth-highest peak in the world, is a majestic mountain that has captivated the imagination of mountaineers and adventurers for centuries. Renowned for its breathtaking beauty, storied past, and formidable challenges, Nanga Parbat beckons those seeking an unforgettable experience.
                              
                    In this blog post, Graana.com will provide a comprehensive overview of Nanga Parbat, covering its geographical significance, cultural importance, historical expeditions, and adventure opportunities.''' , style: TextStyle(color: Colors.white),),
                    SizedBox(height: height * .02,),
                    Text('Overview of Nanga Parbat' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize: 20) ,),
                    SizedBox(height: height * .01,),
                    Text('''Situated in Pakistan’s Gilgit-Baltistan region, Nanga Parbat stands tall at an elevation of 8,126 metres (26,660 feet), ranking as the world’s ninth-highest peak. Translated as “Naked Mountain” in Urdu, its name reflects the rugged and barren nature of its slopes. The mountain’s challenging terrain and towering prominence have contributed to its reputation as one of the most difficult peaks for climbers. ''' , style: TextStyle(color: Colors.white),),                  
                    SizedBox(height: height * .02,),
                    Text('Notable Features' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize: 20) ,),
                    SizedBox(height: height * .01,),
                    Text('''Nanga Parbat boasts significant vertical relief over the local terrain in all directions, earning its place among the world’s most prominent peaks. Its southern Rupal Face is renowned as the highest mountain face globally, soaring an impressive 4,600 metres (15,090 feet) from its base.
                              
 In contrast, the northern Rakhiot Flank presents a complex yet less steep ascent, rising an astounding 7,000 metres (23,000 feet) from the Indus River valley to the summit in a mere 25 kilometres (16 miles), ranking among the planet’s ten most remarkable elevation gains over such a short distance.
                              
 Nanga Parbat is one of only two peaks worldwide that rank among the top twenty highest mountains and the most prominent peaks globally, securing the ninth and fourteenth positions, respectively. The other peak sharing this distinction is the renowned Mount Everest, which claims the top spot on both lists.
                              
Additionally, the mountain stands as the second most prominent peak in the Himalayas, second only to Mount Everest. Its pivotal location, with the key col at Zoji La in the Kashmir Valley, connects it to higher peaks within the Himalaya-Karakoram range.
                              
Situated on the Tibetan Plateau, Nanga Parbat marks the easternmost peak of the Himalayas, while Namcha Barwa denotes the eastern end of this majestic mountain range. ''' , style: TextStyle(color: Colors.white),),                  
                  SizedBox(height: height * .02,),
                  Text('Adventure and Trekking' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize: 20) ,),
                  SizedBox(height: height * .01,),
                  Text('''For those seeking a less technically challenging experience, Nanga Parbat offers mesmerising trekking opportunities. The Rupal Valley Trek and the Fairy Meadows Trek are favoured options, offering awe-inspiring vistas of the mountain and the surrounding landscapes. These treks enable visitors to fully immerse themselves in the natural splendour of the region while enjoying the warm hospitality of the local communities.
                              
Adventure tourism in the Nanga Parbat area is gaining traction, with activities like paragliding, rock climbing, and camping enticing thrill-seekers from various corners of the globe. The Karakoram Highway, renowned as the “Eighth Wonder of the World,” presents a picturesque and adventurous road trip route for accessing the base of the mountain. ''' , style: TextStyle(color: Colors.white),),                  
                   SizedBox(height: height * .02,),
                  Text('Nearby Peaks' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize: 20) ,),
                  SizedBox(height: height * .01,),
                  Text('''Following are the nearby peaks of Nanga Parbat:
                              
.Rakhiot Peak
.Chongra Peak
.Mazeno Peak
.Rupal Peak
.Laila Peak (Rupal Valley)
.Shaigiri ''' , style: TextStyle(color: Colors.white),),                  
                   SizedBox(height: height * .02,),
                   Text('Conclusion' , style: GoogleFonts.robotoFlex(color: Colors.white , fontSize: 20) ,),
                  SizedBox(height: height * .01,),
                  Text('''Nanga Parbat, renowned for its breathtaking beauty, storied past, and formidable obstacles, continues to attract mountaineers and adventurers seeking an unforgettable experience. This magnificent peak perfectly combines natural magnificence, cultural variety, and exhilarating escapades. Whether you aspire to conquer its summit or simply revel in its scenic marvels, a journey to this mountain promises to leave an enduring impression on your spirit.
                              
As you prepare for your expedition or trek, you must honour the mountain, adhere to safety measures, and interact respectfully with the local communities. Nanga Parbat beckons, ready to unveil its grandeur to those brave enough to embrace its majestic charm. ''' , style: TextStyle(color: Colors.white),),                  
                    ]),
                  ),
          SizedBox(height: 12,)
                  ],)
                               )),
    ));
  }
}