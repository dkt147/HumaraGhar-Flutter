import 'package:HumaraGhar/utils/background_container.dart';
import 'package:flutter/material.dart';
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

       body: SingleChildScrollView(
         child: Padding(
           padding: EdgeInsets.symmetric(horizontal :  width * .01),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Text('HumaraGhar Bring you Pakistan\n Property And Real Estate News' ,style: GoogleFonts.robotoFlex(color: Colors.white , fontSize: 22 , fontWeight: FontWeight.w600),),

              newListContainers(height: height , width: width , imageUrl: 'assets/houses/house5.jpg'),
              SizedBox(height: 15,),
              newListContainers(height: height , width: width , imageUrl: 'assets/houses/house3.jpg'),
              SizedBox(height: 15,),
              newListContainers(height: height , width: width , imageUrl: 'assets/houses/house2.jpg'),
              SizedBox(height: 15,),
              newListContainers(height: height , width: width , imageUrl: 'assets/houses/house6.jpg'),
              SizedBox(height: 15,),
              
            ],
           ),
         ),
       ),
       
       
       ));
  }

  newListContainers({height , width , imageUrl }){
    return  Card(
      
      color: Colors.transparent,
          
                  child: Container(
                    // height: height * .5,
                    width: width ,
                    child: Column(children: [
                      Container(
                        height: height * .3,
                        width: width,
                        color: Colors.amber,
                        child: Image.asset(imageUrl , fit: BoxFit.cover,),
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
                                  Text('LHC orders demolition of smoke emitting units on verdict voilation' , style: GoogleFonts.poppins(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.w500),),
                                  SizedBox(height : 8),
                                  Text('Lahore: The Lahore high court issud order to seal smoke-emitting factories and in cases...' , style: GoogleFonts.poppins(color: Color.fromARGB(255, 0, 0, 0) , fontSize: 16), )
                                  
                                ],
                              ),
                            ),
                          ),
                        ),
                    ]),
                  ),
                );
              // );
  }
}