
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class GooglePlaceApiView extends StatefulWidget {
  const GooglePlaceApiView({super.key});

  @override
  State<GooglePlaceApiView> createState() => _GooglePlaceApiViewState();
}

class _GooglePlaceApiViewState extends State<GooglePlaceApiView> {
  
  TextEditingController _searchController = TextEditingController();
  
  var uuid = Uuid();
  String _sessionToken = '123456';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Google Search Api'),
      ) ,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
              TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search places with name'
                ),
              )
          ],
        ),
      ),
    );

  }
}