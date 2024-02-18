import 'package:HumaraGhar/utils/background_container.dart';
import 'package:flutter/material.dart';

class SavedSearches extends StatefulWidget {
  const SavedSearches({super.key});

  @override
  State<SavedSearches> createState() => _SavedSearchesState();
}

class _SavedSearchesState extends State<SavedSearches> {
  @override
  Widget build(BuildContext context) {
     return BackgroundContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Saved Searches'),
        ),
      ));
  }
}