// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet.dart';

// import 'package:HumaraGhar/view/test_screens/image_select.dart';
// import 'package:HumaraGhar/view/test_screens/model/facilitiesModel.dart';

// class selectMultiValue extends StatefulWidget {
//   const selectMultiValue({super.key});

//   @override
//   State<selectMultiValue> createState() => _selectMultiValueState();
// }

// class _selectMultiValueState extends State<selectMultiValue> {


// // List<FacilityModel> facilities = [
// //   FacilityModel('1', 'Electicity', false),
// //   FacilityModel('2','Swimming Pool', false),
// //   FacilityModel('3','Gas', false),
// //   FacilityModel('4','Play Area', false),
// //   ];

// List<String> selectedFacilities = [];

// void showMultiSelectFacilities()async{

//   final List<String> items = [
//     'Electricity' , 'Swimming pools' , 'Gas' , 'Play Area'
//   ];


//   final List<String>? results = await showDialog(
//     context: context,
//     builder: (BuildContext context) {
//         return MultiSelect(items: items);
      
//     });

//   if(results != null){
//     setState(() {
//       selectedFacilities = results;
//     });
//   }

// }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 255, 255, 255),
//       appBar: AppBar(
//         title: Text('Test Screen'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // InkWell(
//           //   onTap: (){
//           //     Expanded(
//           //       child: ListView.builder(
//           //         itemCount: facilities.length,
//           //         itemBuilder: (ctx , index){
//           //           return CheckboxListTile.adaptive(value: facilities[index].isSelected ,
//           //            onChanged: (bool? newValue){
//           //             setState(() {
//           //               facilities[index].isSelected = newValue!;
//           //             });
//           //             if(facilities[index].isSelected){
//           //               selectedFacilities.add(facilities[index]);
//           //             }
//           //           });
//           //       }),
//           //     );

//           //   },
//           // )


//           ElevatedButton(onPressed: ()=> showMultiSelectFacilities(), child:  Text('Select Facilities')),
//           Divider(height: 30,),

//           Wrap(
//             children: selectedFacilities.map((item)=> 
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal : 8.0),
//               child: Chip(
//                 label: Text(item)
                
//                 ),
//             )).toList(),
//           )
//         ],
//       ),
//     );
//   }
// }

// class MultiSelect extends StatefulWidget {

//   final List<String> items;
//   const MultiSelect({
//     Key? key,required this.items,
//   }) : super(key: key);

//   @override
//   State<MultiSelect> createState() => _MultiSelectState();
// }

// class _MultiSelectState extends State<MultiSelect> {
  
//   // this will hold selected items

//     final List<String> _selectedItems = [];

//   // this function is triggered when check box is clicked

//   void itemChange(String itemValue , bool isSelected){
//     setState(() {
//       if(isSelected){
//         _selectedItems.add(itemValue);
//       }else{
//         _selectedItems.remove(itemValue);
//       }
//     });
//   }

//     // for cancel button

//   void _cancel(){
//     Navigator.pop(context);
//   }

//   // for submit button
//   void onSumbit(){
//     Navigator.pop(context , _selectedItems);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog.adaptive(
//       title: Text('Select Facilities'),
//       content: SingleChildScrollView(
//         child: ListBody(
//           children: widget.items.
//           map((item) => CheckboxListTile(
//             value: _selectedItems.contains(item), 
//             title: Text(item),
//             // controlAffinity: ListTileControlAffinity.leading,
//             controlAffinity: ListTileControlAffinity.platform,
//             onChanged: (isChecked) => itemChange(item, isChecked!) )).toList(),

//         ),
//       ),
//       actions: [
//         TextButton(onPressed: _cancel, child: Text('Cancel')),
//         ElevatedButton(onPressed: onSumbit, child: Text('Submit'))
//       ],

//     );
//   }
// }


            ////
            ///
            ///
// Import necessary packages
// import 'package:flutter/material.dart';
// import 'package:get/get.dart'; // Import GetX
// import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet.dart';

// class SelectMultiController extends GetxController {
//   final RxList selectedFacilities = <String>[].obs;

//   Future<void> showMultiSelectFacilities() async {
//     final List<String> items = ['Electricity', 'Swimming pools', 'Gas', 'Play Area'];

//     final List<String>? results = await Get.dialog(
//       MultiSelect(items: items),
//     );

//     if (results != null) {
//       selectedFacilities.assignAll(results);
//     }
//   }

//   void itemChange(String itemValue, bool isSelected) {
//     if (isSelected) {
//       selectedFacilities.add(itemValue);
//       print(itemValue);
//     } else {
//       selectedFacilities.remove(itemValue);
//     }
//   }

//   void cancel() {
//     Get.back(); // Close the dialog
//   }

//   void onSubmit() {
//     Get.back(); // Close the dialog and return selectedFacilities
//     selectedFacilities.forEach((element) {print(element);}); }
// }

// class SelectMultiValue extends StatelessWidget {
//   final SelectMultiController controller = Get.put(SelectMultiController());

//   @override
//   Widget build(BuildContext context) {
//     return  Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () => controller.showMultiSelectFacilities(),
//             child: Text('Select Facilities'),
//           ),
//           Divider(height: 30,),
//           Obx(
//             () => Wrap(
//               children: controller.selectedFacilities.map(
//                 (item) => Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Chip(
//                     label: Text(item),
//                   ),
//                 ),
//               ).toList(),
//             ),
//           )
//         ],
      
//     );
//   }
// }

// class MultiSelect extends StatelessWidget {
//   final List<String> items;
  
//   MultiSelect({
//     Key? key,
//     required this.items,
//   }) : super(key: key);

//   final SelectMultiController controller = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Select Facilities'),
//       content: SingleChildScrollView(
//         child: Obx(
//          () => ListBody(
//             children: items.map(
//               (item) => CheckboxListTile(
//                 value: controller.selectedFacilities.contains(item),
//                 title: Text(item),
//                 controlAffinity: ListTileControlAffinity.platform,
//                 onChanged: (isChecked) => controller.itemChange(item, isChecked!),
//               ),
//             ).toList(),
//           ),
//         ),
//       ),
//       actions: [
//         TextButton(onPressed: controller.cancel, child: Text('Cancel')),
//         ElevatedButton(onPressed: controller.onSubmit, child: Text('Submit'))
//       ],
//     );
//   }
// }
