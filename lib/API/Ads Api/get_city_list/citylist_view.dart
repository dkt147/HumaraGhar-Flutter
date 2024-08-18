
import 'package:HumaraGhar/API/Ads%20Api/get_city_list/service.dart';
import 'package:flutter/material.dart';

class CityListView extends StatefulWidget {
  const CityListView({super.key});

  @override
  State<CityListView> createState() => _CityListViewState();
}

class _CityListViewState extends State<CityListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('City List'),
      ),
      body: FutureBuilder(
        future: CityListService().getCities(), 
        builder: (context , snapshot){
        //  var areaList = snapshot.data!.data!;
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(!snapshot.hasData){
          return Center(child: Text('No City List'));
        }
        else if(snapshot.hasError){
          return Text('Snapshot have error');
        }
        else{
          return ListView.builder(
            itemCount: snapshot.data!.data!.length ,
            itemBuilder: (context , index)
            {
              var category = snapshot.data!.data![index];
              return ListTile(
                title: Text(category.name!),
              );
            });
        }
      }),

    );
  }
}