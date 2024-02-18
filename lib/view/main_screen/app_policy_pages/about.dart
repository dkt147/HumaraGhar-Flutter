import 'package:HumaraGhar/utils/Navigation_Drawer/navigation_drawer.dart';
import 'package:HumaraGhar/utils/background_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return BackgroundContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: SideNavigationDrawer(),
        appBar: AppBar(
            // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 172, 211, 206),),
          title: Text('About Humara Ghar'), 
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                     Center(
                       child: Container(
                        child: Image.asset('assets/images/applogo.png',  height: height * .12  , width: width * .7)),
                     ), 
                          SizedBox(height: height* .02,),
                  Center(child: Text('Who We Are?' , style: GoogleFonts.robotoFlex(fontWeight: FontWeight.w600 , fontSize: 24 , color: Colors.white),)),
              
               SizedBox(height: height* .02,),
                  
                  

                  Text('''HumaraGhar, accessible at Play Store & App Store, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by Website Name and how we use it.
              
    If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us through email at Email@Website.com
              
    This privacy policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in Website Name. This policy is not applicable to any information collected offline or via channels other than this app''' ,
               style: GoogleFonts.robotoFlex(fontWeight: FontWeight.w200 , fontSize: 14, color: Colors.white),),
              
               SizedBox(height: height* .02,),
               Text('Our Journey' , style: GoogleFonts.robotoFlex(fontWeight: FontWeight.w600 , fontSize: 20 , color: Colors.white),),
                SizedBox(height: height* .02,),
                  
                  Text('''By using our website, you hereby consent to our Privacy Policy and agree to its terms.In the awareness stage, the buyer is experiencing a problem or symptoms of a pain, and their goal is to alleviate it. They may be looking for informational resources to more clearly understand, frame, and give a name to their problem.
    
    An example of a search query a prospect might begin with is: "How do I get stronger?" In the awareness stage, they are not yet thinking about solutions or providers; it’s much too early for that. Instead, they’re looking to contextualize their problem first. As a content marketer, you’ll want to show up in search engine results, even in these early stages, to establish your authority and gain the trust of buyers who are starting the journey.''' ,
               style: GoogleFonts.robotoFlex(fontWeight: FontWeight.w200 , fontSize: 14, color: Colors.white),),
              
                  
             SizedBox(height: height* .02,),
          
              SizedBox(height: height* .02,),
               Text('Our Mission' , style: GoogleFonts.robotoFlex(fontWeight: FontWeight.w600 , fontSize: 20 , color: Colors.white),),
                SizedBox(height: height* .02,),
                  
                  Text('''Regarding strategic planning for your organization, you can’t underestimate the importance of having a clear and concise mission statement. Not only does it help provide direction and focus for your team but tells your customer base and community who you are and what you stand for. A well crafted mission statement serves as the foundation for your overall strategy and decision-making.
          
    By outlining your mission statement, you’re laying the groundwork for everything that follows. You’re setting the tone for your vision for your organization and the values you want to uphold. And that can be a powerful tool when it comes to making decisions and setting priorities for the future.
          
    So, if you haven’t already drafted a mission statement, now is the time to start! It may take some time and thought, but the benefits will be well worth it in the long run.''' ,
               style: GoogleFonts.robotoFlex(fontWeight: FontWeight.w200 , fontSize: 14, color: Colors.white),),
              
                  
             SizedBox(height: height* .02,),
                
                  
              ],
            ),
          ),
        ),
       ),
    );
      
        
  }
 }
