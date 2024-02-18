import 'dart:convert';

import 'package:HumaraGhar/API/AuthServices/authService.dart';
import 'package:HumaraGhar/components/email_field.dart';
import 'package:HumaraGhar/components/password_field.dart';
import 'package:HumaraGhar/components/round_button.dart';
import 'package:HumaraGhar/components/text_field.dart';
import 'package:HumaraGhar/routes/routes_name.dart';
import 'package:HumaraGhar/utils/app_colors.dart';
import 'package:HumaraGhar/view/auth/login-view/custom_text_field.dart';
import 'package:HumaraGhar/view/auth/login-view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  bool loading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
              child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .035),
          child: Form(
            key: formKey,
            child: Column(children: [
              SizedBox(
                height: height * .03,
              ),
              Row(
                children: [
                  //  Container(
                  //     child: Image.asset('assets/images/applogo.png',  height: height * .6  , width: width * .)),
                  //   SizedBox(width: width* .05,),
                  Text(
                    'Create Account',
                    style: GoogleFonts.roboto(
                        fontSize: 42,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blueColor),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "Dont't have an account? \nNo worries fill this form to create your account!",
                    style: GoogleFonts.roboto(fontSize: 15),
                  ),
                ],
              ),

              SizedBox(
                height: height * .03,
              ),

              InputTextField(
                  hintText: 'Enter your name',
                  labelText: 'Name',
                  prefixIcon: (Icon(Icons.person, color: AppColors.blueColor)),
                  inputType: TextInputType.name,
                  onEmptyField: 'Name Required',
                  textController: _nameController),

        

              // IntlPhoneField(
              //         initialCountryCode: 'PK',
              //         controller:  _phoneController ,
              //         keyboardType: TextInputType.number,
              //          style: GoogleFonts.notoSansCaucasianAlbanian(color: Colors.black),
              //         cursorColor: const Color.fromARGB(255, 20, 75, 102),
              //         decoration: InputDecoration(

              //           hintText: 'Enter Contact',
              //           hintStyle: TextStyle(color: Color.fromARGB(155, 67, 57, 57)),
              //             enabledBorder: UnderlineInputBorder(

              //       borderSide: BorderSide(color: const Color.fromARGB(255, 59, 76, 78)),
              //       ),
              //       focusedBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: const Color.fromARGB(255, 22, 66, 72)),
              //    ),
              //         ),),
              // InputTextField(
              //     hintText: 'Enter your phone number',
              //     labelText: 'Phone No.',
              //     prefixIcon: Icon(Icons.phone, color: AppColors.blueColor),
              //     inputType: TextInputType.phone,
              //     onEmptyField: 'Phone Number Required*',
              //     textController: _phoneController),
              ////

              SizedBox(
                height: height * .03,
              ),

              EmailField(
                textController: _emailController,
              ),
              SizedBox(
                height: height * .02,
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
                height: height * .02,
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
                height: height * .03,
              ),
              ///////   Contact Field        ///////
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .035),
                  child: IntlPhoneField(
                    
                    flagsButtonPadding: EdgeInsets.only(left: 15) ,
                      initialCountryCode: 'PK',
                      controller: _phoneController,
                      keyboardType: TextInputType.number,
                      pickerDialogStyle: PickerDialogStyle(
                        listTileDivider: Divider(color: Colors.blue.shade200,),
                      countryCodeStyle: TextStyle(fontSize: 14),
                backgroundColor: AppColors.BottomNavigationColor ,
                      ),
                      showDropdownIcon: false,
                      showCountryFlag: true,
                      decoration: InputDecoration(
                        enabled: true,
                        // contentPadding: EdgeInsets.symmetric(horizontal: 1),
                        hintText: '3XX XXXXXXX',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        labelText: 'Contact No.',
                        labelStyle: TextStyle(color: Colors.blue),
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18)),
                      ),
                      validator: (value) {
                        if(value == null){
                          return 'Enter Contact Number';
                        }
                        
                      },
                      )),

            
              SizedBox(
                height: height * .04,
              ),
              RoundButton(
                title: 'Sign Up',
                onTap: () {
                  FocusScope.of(context).unfocus();
                  if (formKey.currentState!.validate()) {
                    if (_confirmPasswordController.text.toString() ==
                        _confirmPasswordController.text.toString()) {
                      print('Email ${_emailController.text}');
                      print('Password ${_passwordController.text}');
                      print('Name ${_nameController.text}');
                      print('Contact ${_phoneController.text}');
                      setState(() {
                        loading = true;
                      });
                      AuthService().signup(
                          _nameController.text,
                          _emailController.text,
                          _passwordController.text,
                          _phoneController.text,
                          context
                          ).then((value) {
                          _emailController.clear();
                          _passwordController.clear();
                          _confirmPasswordController.clear();
                          _phoneController.clear();
                          setState(() {
                        loading = false;
                      });
                          }).onError((error, stackTrace) {
                               setState(() {
                        loading = false;
                      });
                          });
                    }
                  }
                },
                loading: loading,
              ),

              SizedBox(
                height: height * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(RouteName.loginScreen);
                      },
                      child: const Text('Sign in'))
                ],
              )
            ]),
          ),
        ),
      ))),
    );
  }
}
