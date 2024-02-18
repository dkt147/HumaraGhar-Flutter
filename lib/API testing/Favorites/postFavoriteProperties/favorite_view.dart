import 'package:HumaraGhar/API%20testing/Favorites/postFavoriteProperties/post_Favorite_model.dart';
import 'package:HumaraGhar/API%20testing/Favorites/postFavoriteProperties/post_fav_handeler.dart';
import 'package:flutter/material.dart';

class AddFavoritePropertyScreen extends StatefulWidget {
  @override
  _AddFavoritePropertyScreenState createState() => _AddFavoritePropertyScreenState();
}

class _AddFavoritePropertyScreenState extends State<AddFavoritePropertyScreen> {
  TextEditingController propertyNameController = TextEditingController();
  TextEditingController propertyLocationController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Favorite Property'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: propertyNameController,
              decoration: InputDecoration(labelText: 'Property Name'),
            ),
            TextField(
              controller: propertyLocationController,
              decoration: InputDecoration(labelText: 'Property Location'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final favoriteProperty = FavoriteProperty(
                  property_id: propertyNameController.text,
                  user_id: propertyLocationController.text,
                );
                postFavoriteProperty(favoriteProperty);
              },
              child: Text('Add Property'),
            ),
          ],
        ),
      ),
    );
  }
}