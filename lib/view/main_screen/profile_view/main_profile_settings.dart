import 'package:HumaraGhar/utils/background_container.dart';
import 'package:flutter/material.dart';

class MainProfileSettingsView extends StatefulWidget {
  const MainProfileSettingsView({super.key});

  @override
  State<MainProfileSettingsView> createState() => _MainProfileSettingsViewState();
}

class _MainProfileSettingsViewState extends State<MainProfileSettingsView> {
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Main Profile Settings'),),
      ));
  }
}