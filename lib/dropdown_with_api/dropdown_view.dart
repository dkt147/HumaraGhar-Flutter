// import 'package:HumaraGhar/dropdown_with_api/dropdown_controller.dart';
// import 'package:HumaraGhar/utils/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AreaDropdownView extends StatelessWidget {
//   const AreaDropdownView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // final controller = Get.find<AreaDropDownController>();

//     final AreaDropDownController controller = Get.put(AreaDropDownController());

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(title: Text('Area Dropdown')),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal:12.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Obx(
//                 () => DropdownButton(
//             underline: Container(),
//                   // focusColor: Colors.red,r
//               // iconEnabledColor: Colors.amber, 
//                 dropdownColor: AppColors.bottomSheetColor,
//                       // Initial Value 
//                       value: controller.selectedAreaValue.toString() ,
                       
                        
//                       // Down Arrow Icon 
//                       icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black,),     
                        
//                       // Array list of items 
//                       items: controller.areaDropdownData.map((e) => return DropdownMenuItem(child: child)) 
//                       // .map((String items) { 
//                       //   return DropdownMenuItem( 
//                       //     value: items, 
//                       //     child: Text(items), 
//                       //   ); 
//                       // }).toList(), 
//                       // After selecting the desired option,it will 
//                       // change button value to selected value 
//                       onChanged: (String? newValue) {  
//                         dropDownListController.updateSelectedItem(newValue!);
                         
//                       }),
//                 // DropdownButtonFormField<String>(
//                 //   value: controller.selectedAreaValue.value,
//                 //   items: controller.areaDropdownData.map((value) {
//                 //     return DropdownMenuItem<String>(
//                 //       value: value.id, // Assuming 'id' is the identifier field
//                 //       child: Text(value.name ?? ''),
//                 //     );
//                 //   }).toList(),
//                 //   onChanged: (value){
//                 //     controller.selectedAreaValue.value = value!;
//                 //   } ,
//                 // ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   print('Selected value: ${controller.selectedAreaValue}');
//                 },
//                 child: Text('Print Selected Value'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// // class MyTest extends StatefulWidget {
// //   const MyTest({super.key});

// //   @override
// //   State<MyTest> createState() => _MyTestState();
// // }

// // class _MyTestState extends State<MyTest> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Scaffold(
// //       backgroundColor: Colors.white,
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         crossAxisAlignment: CrossAxisAlignment.center,
// //         children: [
// //           AreaDropdownView()
// //         ],.0
// //       ),
// //     );
// //   }
// // }