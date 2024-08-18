import 'package:HumaraGhar/components/round_button.dart';
import 'package:HumaraGhar/constants/app_colors.dart';
import 'package:HumaraGhar/view/auth/otp_view/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OTP_Screen extends StatefulWidget {
  const OTP_Screen({super.key});

  @override
  State<OTP_Screen> createState() => _OTP_ScreenState();
}

class _OTP_ScreenState extends State<OTP_Screen> {
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
        return await SystemChannels.platform
            .invokeMethod('SystemNavigator.pop');
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Verification'),
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * .03,
                  ),
                  Center(
                    child: Container(
                        child: Image.asset('assets/images/applogo.png',
                            height: height * .12, width: width * .7)),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Text('Email Verification',
                      style: GoogleFonts.roboto(
                          fontSize: 34,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blueColor)),
                  Text(
                    'We have sent you a 6 digit OTP on your email. Write it down to reset your password ',
                    style: GoogleFonts.ptSerif(
                        fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Pinput(
                    keyboardType: TextInputType.number,
                    length: 6,
                    showCursor: true,
                    toolbarEnabled: true,
                    defaultPinTheme: PinTheme(
                        width: width * .15,
                        height: height * .1,
                        textStyle: TextStyle(
                            fontSize: 35,
                            color: Color.fromARGB(255, 49, 48, 48)),
                        decoration: BoxDecoration(
                          color: AppColors.bottomSheetColor,
                          borderRadius: BorderRadius.circular(20),
                          // border: Border.all()
                        )),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundButton(
                          width: width * .4,
                          title: 'Resend OTP',
                          onTap: () {
                            // Get.to(LoginScreen());
                          },
                          loading: loading),
                      RoundButton(
                          width: width * .4,
                          title: 'Next',
                          onTap: () {
                            Get.to(ResetPasswordScreen());
                          },
                          loading: loading),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
