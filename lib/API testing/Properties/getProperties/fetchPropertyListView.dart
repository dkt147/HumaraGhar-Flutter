import 'package:HumaraGhar/API%20testing/Properties/getProperties/fetchPropertyListController.dart';
import 'package:HumaraGhar/API%20testing/Properties/getProperties/propertyListModel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';


// Define your model classes and methods here

class PropertyListModelView extends StatefulWidget {
  @override
  _PropertyListModelViewState createState() => _PropertyListModelViewState();
}

class _PropertyListModelViewState extends State<PropertyListModelView> {
  late Future<PropertyListModel> futurePropertyList;

  @override
  void initState() {
    super.initState();
    futurePropertyList = fetchPropertyList();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Property List'),
      ),
      body: Center(
        child: FutureBuilder<PropertyListModel>(
          future: futurePropertyList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PropertyListView(propertyList: snapshot.data!.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class PropertyListView extends StatelessWidget {
  final List<Property> propertyList;

  PropertyListView({required this.propertyList});
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: propertyList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(propertyList[index].name),
          subtitle: Text('Price: ${propertyList[index].price}'),
          trailing: Text('Agency: ${propertyList[index].agencies[index].name }'),
          onTap: () {
            // Navigate to property details screen
          },
        );
      },
    );
  }
}

