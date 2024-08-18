
import 'package:HumaraGhar/API/Ads%20Api/get_city_list/service.dart';
import 'package:HumaraGhar/API/Ads%20Api/get_main_feature_list/service.dart';
import 'package:flutter/material.dart';

class MainFeaturesView extends StatefulWidget {
  const MainFeaturesView({super.key});

  @override
  State<MainFeaturesView> createState() => _MainFeaturesViewState();
}

class _MainFeaturesViewState extends State<MainFeaturesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Main Features List'),
      ),
      body: FutureBuilder(
        future: MainFeatureService().getMainFeatures(), 
        builder: (context , snapshot){
        //  var areaList = snapshot.data!.data!;
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(!snapshot.hasData){
          return Center(child: Text('No Main Features'));
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