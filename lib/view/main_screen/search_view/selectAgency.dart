import 'package:HumaraGhar/utils/background_container.dart';
import 'package:HumaraGhar/view-model/select_Agency_Controller/select_Agency_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SelectAgencyView extends StatefulWidget {
  const SelectAgencyView({super.key});

  @override
  State<SelectAgencyView> createState() => _SelectAgencyViewState();
}

class _SelectAgencyViewState extends State<SelectAgencyView> {

  // List agencyList = [
  //   '21 Century',
  //   '360 Property Network',
  //   '3 Star Real Estate',
  //   '4 Walls Network Builders & Contractors',
  //   'A.Z Estate',
  //   'AB ENTERPRISES',
  //   'Abdullah Estate',
  //   'Al Jadeed Properties',
  //   'Al Kabeer Associates',
  //   'Al Moiz Enterprise',
  //   'Alpha Land',
  //   'Arfat Estate & Marketing',
  //   'Basit Associates',
  //    'A.Z Estate',
  //   'AB ENTERPRISES',
  //   'Abdullah Estate',
  //   'Al Jadeed Properties',
  //   'Bin Aziz Associates ',
  //    '21 Century',
  //   '360 Property Network',
  //   '3 Star Real Estate',
  //   '4 Wall',
  //    'AB ENTERPRISES',
  //   'Abdullah Estate',
  //   'Al Jadeed Properties',
  //   'Bin Aziz Associates ',
  //    '21 Century',

  // ];


  @override
  Widget build(BuildContext context) {
    
  final SelectAgencyController selectAgencyController = Get.put(SelectAgencyController());
    
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return BackgroundContainer(
      child: Scaffold(
       backgroundColor: Colors.transparent,
      appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(255, 172, 211, 206),),
        automaticallyImplyLeading: true,
        title: Text('Search Agency'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
           
            Row(
                children: [
                  Container(
                      height: height * .05,
                      width: width * .92,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(22)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric( horizontal : 3.0),
                        child: TextField(
                          onChanged: selectAgencyController.filterAgencies,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            isDense: true,
                            // contentPadding: EdgeInsets.only(top  :.0001),
                            prefixIcon: Icon(Icons.search , color:  Color.fromARGB(255, 52, 47, 47), size: 22,),
                            hintText: 'Search Agency',
                            hintStyle: TextStyle(color: Color.fromARGB(255, 89, 84, 84)),
                          ),),
                      ),
                    ),
                  
            
                ],
              ),
            
            SizedBox(height: height * .02,),
            Expanded(
              child: Obx(
                ()=> ListView.builder(
                  itemCount: selectAgencyController.filterAgency.length,
                  itemBuilder: (context , index){
                    return Padding(
                      padding: const EdgeInsets.only(left : 8.0 , top: 2),
                      child: Container(
                        height: height * .05,
                        width: width * .9,
                        child: InkWell(
                          onTap: (){
                            selectAgencyController.setAgency(selectAgencyController.filterAgency[index]);
                          },
                          child: Text(selectAgencyController.filterAgency[index] , style: TextStyle(color: Colors.white),))),
                    );
                          
                }),
              ),
            )
          ],
        ),
      )
    ));
  }
}