import 'package:HumaraGhar/API/AboutUsServices/about_handeler.dart';
import 'package:HumaraGhar/API/PrivacyPolicyServices/pp_handler.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('PrivacyPolicy'),
      ),
      body: FutureBuilder(
        future: PrivacyPolicyService().privacyPolicyHandeler(), 
        builder: (context , snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if(!snapshot.hasData){
            return Text('No data ');
          }
          else{
           return ListView.builder(
            itemCount: snapshot.data!.data!.length,
            itemBuilder: (context , index){
              final content = snapshot.data!.data![index];
              return Column(
                  children: [
                    Text(content.heading.toString() , style:  TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                    SizedBox(height: 8,),
                    Text(content.content.toString() , style:  TextStyle(fontSize: 15 , fontWeight: FontWeight.w500),),
                    SizedBox(height: 8,),
                  ],
             );

            });
          }
        }),
    );
  }
}