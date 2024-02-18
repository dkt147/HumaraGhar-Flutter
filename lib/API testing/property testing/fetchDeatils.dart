import 'package:HumaraGhar/API%20testing/property%20testing/model.dart';
import 'package:flutter/material.dart';

class FetchPropertyDetails extends StatefulWidget {
  final Property property;

  const FetchPropertyDetails({super.key, required this.property});

  @override
  State<FetchPropertyDetails> createState() => _FetchPropertyDetailsState();
}

class _FetchPropertyDetailsState extends State<FetchPropertyDetails> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Column(
        children: [
          Expanded(
                child: ListView.builder(
                  itemCount: widget.property.propertyAttachments.length,
                  itemBuilder: (context , index){
                    final propertyAttachment = widget.property.propertyAttachments[index];
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                                         height: height * .2 ,
                                         width: width * .9,
                                         child: Image.network(propertyAttachment.url)
                                    
                              
                                  ),
                    ); 
                
                  }),
              ),
            
          
          
        ],
      ),
    );
  }
}