// import 'package:HumaraGhar/API%20testing/Ads%20Api/get_area_list/service.dart';
// import 'package:flutter/material.dart';

// class AreaListView extends StatefulWidget {
//   const AreaListView({super.key});

//   @override
//   State<AreaListView> createState() => _AreaListViewState();
// }

// class _AreaListViewState extends State<AreaListView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Area List'),
//       ),
//       body: FutureBuilder(future: AreaListService().getAreaList(), 
//       builder: (context , snapshot){
//         //  var areaList = snapshot.data!.data!;
//         if(snapshot.connectionState == ConnectionState.waiting){
//           return Center(child: CircularProgressIndicator(),);
//         }
//         else if(!snapshot.hasData){
//           return Center(child: Text('No Area List'));
//         }
//         else if(snapshot.hasError){
//           return Text('Snapshot have error');
//         }
//         else{
//           return ListView.builder(
//             itemCount: snapshot.data!.data!.length ,
//             itemBuilder: (context , index)
//             {
//               var area = snapshot.data!.data![index];
//               return ListTile(
//                 title: Text(area.name.toString()),
//                 subtitle: Text(area.id.toString()),
//               );
//             });
//         }
//       }),

//     );
//   }
// }



 
import 'package:HumaraGhar/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:HumaraGhar/API/Ads%20Api/get_area_list/service.dart';

class AreaListView extends StatefulWidget {
  const AreaListView({Key? key});

  @override
  State<AreaListView> createState() => _AreaListViewState();
}

class _AreaListViewState extends State<AreaListView> {
  String? _selectedAreaId;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: AreaListService().getAreaSizeList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData) {
            return Center(child: Text('No Area List'));
          } else if (snapshot.hasError) {
            return Text('Snapshot has error');
          } else {
            final areas = snapshot.data!.data!;
            return Container(
        height : 40 ,
        width: width * .6,
        decoration: BoxDecoration(
          color: AppColors.BottomNavigationColor, 
        
          // borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 4.0 , left: 8 , ),
          child: 
                DropdownButton<String>(
                  isExpanded: true,
                  hint: Text('Select Area'),
                  value: _selectedAreaId,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedAreaId = newValue;
                    });
                  },
                  items: areas
                      .map<DropdownMenuItem<String>>(
                        (area) => DropdownMenuItem<String>(
                          value: area.id.toString(),
                          child: Text(area.name.toString()),
                        ),
                      )
                      .toList(),))
                
            );
          }
        },
      
    );
  }
}



 
/*
 import 'dart:convert';

import 'package:HumaraGhar/API%20testing/Ads%20Api/get_area_list/area_model.dart';
import 'package:HumaraGhar/API%20testing/Ads%20Api/get_area_list/service.dart';
import 'package:HumaraGhar/utils/app_colors.dart';
import 'package:HumaraGhar/view-model/dropdown_controller/dropdown_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class AreaSizeDropDownButton extends StatelessWidget {
   AreaSizeDropDownButton({super.key});



  // String initialDropdownValue = 'Sq Ft.';

  // List<String> areaUnit = ['Sq Ft.' , 'Marala', 'Acre'];
  
  Future<AreaListModel> getAreaSizeList()async {

  try{

    var url = Uri.parse('https://cybernsoft.com/hg/ad/area_list.php') ;
    var response = await http.get(url) ;

    if(response.statusCode ==200){
        var jsonResponse = jsonDecode(response.body);
       
        // if(response['status'] == 1){

        // }

        return AreaListModel.fromJson(jsonResponse);


    }else{
      throw Exception('API returned Error ${response.statusCode} and ${response.reasonPhrase} ');
      // throw Exception('API returned status ${jsonResponse['status']}: ${jsonData['message']}');
    }
    
    


  }catch(e){
    return throw {'Excption caught : ${e.toString()}'};
  }

}    
  @override
  Widget build(BuildContext context) {
    final DropDownListController dropDownListController = Get.put(DropDownListController());
    return  Obx( ()
      =>  Container(
        height : 40 ,
        width: 80,
        decoration: BoxDecoration(
          color: AppColors.BottomNavigationColor, 
        
          // borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 4.0 , left: 8 , ),
          child: FutureBuilder(
            future: AreaListService().getAreaSizeList() , 
            builder: (context , snapshot){
              if(snapshot.hasData){
                var areaSize = snapshot.data!.data!;
                return   DropdownButton(
            underline: Container(),
                dropdownColor: AppColors.bottomSheetColor,
                      // Initial Value 
                hint : Text('Select Area Size'),
                value: dropDownListController.selectedAreaSize.value ,
                       
                        
                      // Down Arrow Icon 
                  icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black,),     
                        
                      // Array list of items 
                      items: areaSize.map<DropdownMenuItem<String>>(
              (area) => DropdownMenuItem<String>(
                value: area.id.toString(),
                child: Text(area.name.toString()),
              ),
            ).toList(),
                      // After selecting the desired option,it will 
                      // change button value to selected value 
                      onChanged: (String? newValue) {  
                        dropDownListController.updateSelectedAreaSize(newValue!);
                         
                      });
        
              }else{
                return Center(child :  CircularProgressIndicator());
              }
            })
          
        
        ),
      ),
    ); 
              
           
           
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:HumaraGhar/API%20testing/Ads%20Api/get_area_list/area_model.dart';
import 'package:HumaraGhar/utils/app_colors.dart';
import 'package:HumaraGhar/view-model/dropdown_controller/dropdown_controller.dart';

class AreaSizeDropDownButton extends StatelessWidget {
  const AreaSizeDropDownButton({Key? key}) : super(key: key);

  Future<List<Data>?> fetchAreaSizeList() async {
    try {
      var url = Uri.parse('https://cybernsoft.com/hg/ad/area_list.php');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return AreaListModel.fromJson(jsonResponse).data;
      } else {
        throw Exception('API returned Error ${response.statusCode} and ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Exception caught : ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final DropDownListController dropDownListController = Get.put(DropDownListController());

    return Container(
      height: 40,
      width: 80,
      decoration: BoxDecoration(
        color: AppColors.BottomNavigationColor,
        // borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 4.0, left: 8),
        child: FutureBuilder<List<Data>?>(
          future: fetchAreaSizeList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Snapshot has error'));
            } else if (snapshot.hasData) {
              return Obx(() => DropdownButton<String>(
                    underline: Container(),
                    dropdownColor: AppColors.bottomSheetColor,
                    hint: Text('Select Area Size'),
                    value: dropDownListController.selectedAreaSize.value,
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    items: snapshot.data!
                        .map((area) => DropdownMenuItem<String>(
                              value: area.id.toString(),
                              child: Text(area.name.toString()),
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      dropDownListController.updateSelectedAreaSize(newValue!);
                    },
                  ));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

*/