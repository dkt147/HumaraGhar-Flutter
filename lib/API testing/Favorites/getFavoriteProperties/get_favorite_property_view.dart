
import 'package:HumaraGhar/API%20testing/Favorites/getFavoriteProperties/get_fav_handeler.dart';
import 'package:HumaraGhar/API%20testing/Favorites/getFavoriteProperties/get_favorite_model.dart';
import 'package:flutter/material.dart';

class FavoritePropertiesPage extends StatefulWidget {
  @override
  _FavoritePropertiesPageState createState() => _FavoritePropertiesPageState();
}

class _FavoritePropertiesPageState extends State<FavoritePropertiesPage> {
  late Future<List<GetFavoriteProperty>> _futureProperties;

  @override
  void initState() {
    super.initState();
    _futureProperties = fetchFavoriteProperties('2'); // Pass the user ID here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Favorite Properties'),
      ),
      body: FutureBuilder<List<GetFavoriteProperty>>(
        future: _futureProperties,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].propertyName),
                  subtitle: Text(snapshot.data![index].userName),
                );
              },
            );
          }
        },
      ),
    );
  }
}