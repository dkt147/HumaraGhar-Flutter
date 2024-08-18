import 'package:HumaraGhar/API/property%20testing/Properties/getProperties/propertyListModel.dart';
import 'package:flutter/material.dart';
import 'search_property_service.dart';

class TestPropertyFilter extends StatefulWidget {
  @override
  _TestPropertyFilterState createState() => _TestPropertyFilterState();
}

class _TestPropertyFilterState extends State<TestPropertyFilter> {
  late Future<PropertyListModel> _searchPropertiesFuture;
  String? cityId;
  String? priceMin;
  String? priceMax;
  String? areaMin;
  String? areaMax;

  @override
  void initState() {
    super.initState();
    // Initialize the search with default values or leave them empty
    cityId = null;
    priceMin = null;
    priceMax = null;
    areaMin = null;
    areaMax = null;
    _searchPropertiesFuture = _searchProperties();
  }

  Future<PropertyListModel> _searchProperties() {
    return SearchPropertyService.searchProperties(
      cityId: cityId,
      priceMin: priceMin,
      priceMax: priceMax,
      areaMax: areaMax,
      areaMin: areaMin
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Property Search'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'City ID'),
              onChanged: (value) {
                setState(() {
                  cityId = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price Min'),
              onChanged: (value) {
                setState(() {
                  priceMin = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price Max'),
              onChanged: (value) {
                setState(() {
                  priceMax = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'AreaMin'),
              onChanged: (value) {
                setState(() {
                  areaMin = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Area Max'),
              onChanged: (value) {
                setState(() {
                  areaMax = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _searchPropertiesFuture = _searchProperties();
                });
              },
              child: Text('Search'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<PropertyListModel>(
                future: _searchPropertiesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // Display your search results here
                    // return Text('Search Results: ${snapshot.data}');
                    return ListView.builder(
                      itemCount: snapshot.data!.data.length,
                      itemBuilder: (context , index){
                        return ListTile(
                          title: Text(snapshot.data!.data[index].propertyCity.name.toString()),
                        );
                      });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
