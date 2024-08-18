import 'package:HumaraGhar/API/Favorites/loginDetails/profileDetailsformSP.dart';
import 'package:HumaraGhar/API/AuthServices/authService.dart';
import 'package:HumaraGhar/components/email_field.dart';
import 'package:HumaraGhar/components/password_field.dart';
import 'package:HumaraGhar/components/round_button.dart';
import 'package:HumaraGhar/routes/routes_name.dart';
import 'package:HumaraGhar/view/auth/forgetpassword_view/forgetpassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginDetails extends StatefulWidget {
  const LoginDetails({super.key});

  @override
  State<LoginDetails> createState() => _LoginDetailsState();
}

class _LoginDetailsState extends State<LoginDetails> {
  final formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool loading = false;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
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
                   
                      EmailField(textController: _emailController),
                      SizedBox(
                        height: height * .03,
                      ),
                      PasswordField(
                        labelText: 'Password',
                        onEmptyField: 'Password Required',
                        passwordController: _passwordController,
                        confirmPasswordController: _passwordController.text,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Password Required';
                          }
                          else{
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Get.to(const ForgetPassword());
                              },
                              child: const Text(
                                'Forget Password?',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                      RoundButton(
                        title: 'Sign in',
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (formKey.currentState!.validate()) {
                            print('Email : ${_emailController.text}');
                            print('Password : ${_passwordController.text}');
                          setState(() {
                            loading = true;
                          });
                            //  login;
                            AuthService()
                                .login(_emailController.text,
                                    _passwordController.text, context)
                                .then((value){
                                           setState(() {
                                  loading = false;
                                  });
                                 _emailController.clear();
                                 _passwordController.clear();
                                 Get.to(ProfileDetailsFromSPView());
                            }).onError((error, stackTrace) {
                                      setState(() {
                                  loading = false;
                                  });
                                 _emailController.clear();
                                 _passwordController.clear();
                          
                            });
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
                          const Text('Don\'t have an account?'),
                          TextButton(
                              onPressed: () {
                                Get.toNamed(RouteName.signupScreen);
                              },
                              child: const Text('Sign up'))
                        ],
                      )
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
