import 'package:HumaraGhar/utils/Navigation_Drawer/navigation_drawer.dart';
import 'package:HumaraGhar/utils/background_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsCondition extends StatefulWidget {
  const TermsCondition({super.key});

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsCondition> {
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
              Center(child: Text('Terms And Privacy Policy' , style: GoogleFonts.robotoFlex(fontWeight: FontWeight.w600 , fontSize: 24 , color: Colors.white),)),
          
           SizedBox(height: height* .02,),
              Text(''' At HumaraGhar, accessible at Play Store & App Store, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by Website Name and how we use it.
          
    If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us through email at Email@Website.com
          
    This privacy policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in Website Name. This policy is not applicable to any information collected offline or via channels other than this app''' ,
           style: GoogleFonts.robotoFlex(fontWeight: FontWeight.w200 , fontSize: 14, color: Colors.white),),
          
           SizedBox(height: height* .02,),
           Text('Consent' , style: GoogleFonts.robotoFlex(fontWeight: FontWeight.w600 , fontSize: 20 , color: Colors.white),),
            SizedBox(height: height* .02,),
    
              Text(''' By using our website, you hereby consent to our Privacy Policy and agree to its terms.''' ,
           style: GoogleFonts.robotoFlex(fontWeight: FontWeight.w200 , fontSize: 14, color: Colors.white),),
          
    
         SizedBox(height: height* .02,),
             Text('Information we collect' , style: GoogleFonts.robotoFlex(fontWeight: FontWeight.w600 , fontSize: 20 , color: Colors.white),),
            SizedBox(height: height* .02,),
    
           Text('''The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.
    
    If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide.
    
    When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.''' ,
           style: GoogleFonts.robotoFlex(fontWeight: FontWeight.w200 , fontSize: 14, color: Colors.white),),
          
    
         SizedBox(height: height* .02,),
    
         Text('How we use your information' , style: GoogleFonts.robotoFlex(fontWeight: FontWeight.w600 , fontSize: 20 , color: Colors.white),),
            SizedBox(height: height* .02,),
    
                    Text('''We use the information we collect in various ways, including to:
    
    . Provide, operate, and maintain our website
    . Improve, personalize, and expand our website
    . Understand and analyze how you use our website
    . Develop new products, services, features, and  functionality
    . Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes
    . Send you emails
    . sFind and prevent fraud.''' ,
           style: GoogleFonts.robotoFlex(fontWeight: FontWeight.w200 , fontSize: 14, color: Colors.white),),
          SizedBox(height: height* .02,),
    
         Text('Advertising Partners Privacy Policies' , style: GoogleFonts.robotoFlex(fontWeight: FontWeight.w600 , fontSize: 20 , color: Colors.white),),
            SizedBox(height: height* .02,),
    
              Text('''You may consult this list to find the Privacy Policy for each of the advertising partners of Website Name.
    
    Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on Website Name, which are sent directly to users' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.
    
    Note that Website Name has no access to or control over these cookies that are used by third-party advertisers.''' ,
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
