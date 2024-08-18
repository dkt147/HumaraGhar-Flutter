import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget {
  final Text? appBarTitle;
  const CustomAppBar({super.key, this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: appBarTitle ?? null,
       systemOverlayStyle: SystemUiOverlayStyle( statusBarColor: Color.fromARGB(255, 172, 211, 206),),
    );
  }
}