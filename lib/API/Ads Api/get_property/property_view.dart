
import 'package:HumaraGhar/API/Ads%20Api/get_city_list/service.dart';
import 'package:HumaraGhar/API/Ads%20Api/get_main_feature_list/service.dart';
import 'package:HumaraGhar/API/Ads%20Api/get_nearby_location/service.dart';
import 'package:flutter/material.dart';

class NearByLocationView extends StatefulWidget {
  const NearByLocationView({super.key});

  @override
  State<NearByLocationView> createState() => _NearByLocationViewState();
}

class _NearByLocationViewState extends State<NearByLocationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('NearBy Location'),
      ),
      body: FutureBuilder(
        future: NearByLocationService().getNearByLocations(), 
        builder: (context , snapshot){
        //  var areaList = snapshot.data!.data!;
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(!snapshot.hasData){
          return Center(child: Text('No Near By Location'));
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