import 'package:HumaraGhar/API/AboutUsServices/about_handeler.dart';
import 'package:HumaraGhar/constants/background_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BackgroundContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 172, 211, 206),
          ),
          title: Text('About us'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_forward)),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    child: Image.asset('assets/images/applogo.png',
                        height: height * .12, width: width * .7)),
              ),
              SizedBox(
                height: height * .02,
              ),
              Center(
                  child: Text(
                'About Us',
                style: GoogleFonts.robotoFlex(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.white),
              )),
              SizedBox(
                height: height * .015,
              ),
              Expanded(
                child: FutureBuilder(
                    future: AboutUsService().aboutusHandeler(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (!snapshot.hasData) {
                        return Text('No data ');
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.data!.length,
                            itemBuilder: (context, index) {
                              final content = snapshot.data!.data![index];
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    content.heading.toString(),
                                    style: GoogleFonts.robotoFlex(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(content.content.toString(),
                                      style: GoogleFonts.robotoFlex(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 14,
                                          color: Colors.white)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            });
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );

    /*

       return BackgroundContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: SideNavigationDrawer(),
        appBar: AppBar(
            // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 172, 211, 206),),
          title: Text('Terms & Privacy Policy'), 
        actions: [Padding(
          padding: const EdgeInsets.only( right : 12.0),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_forward)),
        ) , ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Center(
                 child: Container(
                  child: Image.asset('assets/images/applogo.png',  height: height * .12  , width: width * .7)),
               ), 
                    SizedBox(height: height* .02,),
            Center(child: Text('Terms And Privacy Policy' , style: GoogleFonts.robotoFlex(fontWeight: FontWeight.w600 , fontSize: 24 , color: Colors.white),)),
                    
                     Expanded(
           child: FutureBuilder(
                   future: PrivacyPolicyService().privacyPolicyHandeler(), 
                   builder: (context , snapshot){
                     if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
                     }else if(!snapshot.hasData){
            return Text('No data ');
                     }
                     else{
           return ListView.builder(
            itemCount: snapshot.data!.data!.length,
            itemBuilder: (context , index){
              final content = snapshot.data!.data![index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(content.heading.toString() , style: GoogleFonts.robotoFlex(fontWeight: FontWeight.w600 , fontSize: 20 , color: Colors.white),),
                     SizedBox(height: height* .02,),
                    Text(content.content.toString() ,  style: GoogleFonts.robotoFlex(fontWeight: FontWeight.w200 , fontSize: 14, color: Colors.white),),
                    SizedBox(height: 8,),
                  ],
             );
           
            });
                     }
                   }),
                     ),
            
                    
            ],
          ),
        ),
       ),
    );
       */
  }
}
