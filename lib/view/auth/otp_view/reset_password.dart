
import 'package:HumaraGhar/components/password_field.dart';
import 'package:HumaraGhar/components/round_button.dart';
import 'package:HumaraGhar/constants/app_colors.dart';
import 'package:HumaraGhar/view/auth/login-view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final  _confirmPasswordController = TextEditingController();
  bool loading = false;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _passwordController.dispose();
     _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;
    return WillPopScope(
      onWillPop: () async {
      return  await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      },
      child : Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: GestureDetector(
          // To Hide Keyboard
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .03),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * .1,
                      ),
                      Container(
                          child: Image.asset('assets/images/applogo.png',
                              height: height * .12, width: width * .7)),
                      SizedBox(
                        height: height * .05,
                      ),
                      Text('Reset Password',
                          style: GoogleFonts.roboto(
                              fontSize: 42,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blueColor)),
                      SizedBox(
                        height: height * .03,
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                       PasswordField(
                labelText: 'Password',
                onEmptyField: 'Enter Password*',
                passwordController: _passwordController,
                confirmPasswordController: _passwordController.text,
                 validator: (value){
                        if(value!.isEmpty){
                          return 'Password Required';
                        }else if(value.length < 8 ){
                          return 'Password should contain at least 8 characters';
                        }
                        else{
                          return null;
                        }
                      },
              ),

              SizedBox(
                height: height * .03,
              ),
              PasswordField(
                labelText: 'Confirm Password',
                onEmptyField: 'Confirm Password*',
                passwordController: _confirmPasswordController,
                confirmPasswordController: _passwordController.text,
                 validator: (value){
                        if(value!.isEmpty){
                          return 'Confirm Password Required';
                        }
                        else if(value != _passwordController.text){
                          return 'Password do not match';
                        }
                        else{
                          return null;
                        }
                      },
              ),
                      SizedBox(
                        height: height * .01,
                      ),
                      
                      SizedBox(
                        height: height * .03,
                      ),
                      RoundButton(
                        title: 'Reset Password',
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (formKey.currentState!.validate()) {
                            print('Email : ${_confirmPasswordController.text}');
                            print('Password : ${_passwordController.text}');
                          // setState(() {
                          //   loading = true;
                          // });
                          Get.to(LoginScreen());
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Reset Password Successfully!')));
                      
                            
                          }
                        },
                        loading: loading,
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
