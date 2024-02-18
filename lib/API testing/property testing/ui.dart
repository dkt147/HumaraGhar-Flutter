import 'package:HumaraGhar/API%20testing/property%20testing/fetchDeatils.dart';
import 'package:HumaraGhar/API%20testing/property%20testing/getProperty.dart';
import 'package:HumaraGhar/API%20testing/property%20testing/model.dart';
import 'package:flutter/material.dart';

class PropertyListScreen extends StatefulWidget {
  @override
  _PropertyListScreenState createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends State<PropertyListScreen> {
  late Future<List<Property>> futureProperties;

  @override
  void initState() {
    super.initState();
    futureProperties = FetchPropertyServices().fetchProperties();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Properties'),
      ),
      body: FutureBuilder<List<Property>>(
        future: futureProperties,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final property = snapshot.data![index];
                return ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => FetchPropertyDetails(property: property,))));
                  },
                  title: Text(property.name),
                  subtitle: Text('Price: ${property.price}'),
                  // Add more fields as needed
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
