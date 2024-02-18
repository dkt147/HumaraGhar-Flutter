import 'package:HumaraGhar/API%20testing/Properties/getProperties/propertyListModel.dart';
import 'package:flutter/material.dart';


import 'dart:convert';
import 'package:HumaraGhar/API%20testing/property%20testing/model.dart';
import 'package:http/http.dart' as http;


class FetchPropertyForListing{
Future<List<PropertyListModel>> fetchProperties() async {
  final response = await http.get(Uri.parse('https://cybernsoft.com/hg/project_list.php'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    if (jsonData['status'] == 1) {
      List<PropertyListModel> properties = [];
      for (var item in jsonData['data']) {
        properties.add(PropertyListModel.fromJson(item));
      }
      return properties;
    } else {
      throw Exception('API returned status ${jsonData['status']}: ${jsonData['message']}');
    }
  } else {
    throw Exception('Failed to load properties: ${response.statusCode}');
  }
}
}

class PropertiesListingPage extends StatefulWidget {
  const PropertiesListingPage({super.key});

  @override
  State<PropertiesListingPage> createState() => _PropertiesListingPageState();
}

class _PropertiesListingPageState extends State<PropertiesListingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Property Listing'),
      ),
      body: FutureBuilder<List<PropertyListModel>>(
        future: FetchPropertyForListing().fetchProperties(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final propertyList = snapshot.data![index];
                final property = propertyList.data[index];
                 return ListTile(
                title: Text(property.name),
                subtitle: Text(property.propertyLocationId),
              );
          });
          }
          else{
            return Text('No DATA');
          }
          }

      ,),
    );
  }
}