import 'package:HumaraGhar/utils/background_container.dart';
import 'package:flutter/material.dart';

class draftView extends StatefulWidget {
  const draftView({super.key});

  @override
  State<draftView> createState() => _draftViewState();
}

class _draftViewState extends State<draftView> {
  @override
  Widget build(BuildContext context) {
     return BackgroundContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Draft'),
        ),
      ));
  }
}