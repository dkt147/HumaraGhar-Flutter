
import 'package:HumaraGhar/API/Ads%20Api/get_category_list/service.dart';
import 'package:flutter/material.dart';

class PropertAdsCategoryView extends StatefulWidget {
  const PropertAdsCategoryView({super.key});

  @override
  State<PropertAdsCategoryView> createState() => _PropertAdsCategoryViewState();
}

class _PropertAdsCategoryViewState extends State<PropertAdsCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Propert Ads Category'),
      ),
      body: FutureBuilder(future: PropertyAdsCategoryService().getCategories(), 
      builder: (context , snapshot){
        //  var areaList = snapshot.data!.data!;
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(!snapshot.hasData){
          return Center(child: Text('No PropertAdsCategory List'));
        }
        else if(snapshot.hasError){
          return Text('Snapshot have error');
        }
        else{
          return ListView.builder(
            itemCount: snapshot.data!.data!.house!.length ,
            itemBuilder: (context , index)
            {
              var category = snapshot.data!.data!.house![index];
              return ListTile(
                title: Text(category.name!),
                subtitle: Text(category.propertyCategoryId!),
              );
            });
        }
      }),

    );
  }
}