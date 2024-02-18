import 'package:HumaraGhar/components/email_field.dart';
import 'package:HumaraGhar/components/round_button.dart';
import 'package:HumaraGhar/routes/routes_name.dart';
import 'package:HumaraGhar/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  final formkey = GlobalKey<FormState>();
  final _emailController =  TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
 
  }

  @override
  Widget build(BuildContext context) {
        double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;
    return  Scaffold(
     backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width * .03),
          child: SafeArea(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(height: height* .03,),
                        Image.asset('assets/images/applogo.png',  height: height * .12  , width: width * .7), 
                          SizedBox(height: height* .03,),
                  Text('Reset Password' , style: GoogleFonts.roboto(fontSize: 42 , fontWeight: FontWeight.w500 , color: AppColors.blueColor )),
                  SizedBox(height: height* .03,),
                  Flexible(child: Text(
                    'Enter the email associated with your account and we \'ll send an email with instructions to reset your password. ' ,
                    style: GoogleFonts.ptSerif (fontSize: 14),)),
                    
                  SizedBox(height: height* .03,),
                  
                  EmailField(textController: _emailController) ,
                
                  SizedBox(height: height* .03,),
                  
            
                
                  RoundButton(title: 'Reset' , onTap: (){
                    Get.toNamed(RouteName.loginScreen);
                  }, loading: false,  )
                ],
                
              ),
            ),
          ),
        ),
      ),
    );
  }
}