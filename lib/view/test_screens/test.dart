// import 'dart:io';

// import 'package:HumaraGhar/view/main_screen/post_ad/components/dropDown_button.dart';
import 'package:HumaraGhar/List/list_of_cities.dart';
import 'package:HumaraGhar/components/add_city_bottom_sheet.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
// import 'package:image_picker/image_picker.dart';

// class test extends StatefulWidget {
//   const test({super.key});

//   @override
//   State<test> createState() => _testState();
// }

// class _testState extends State<test> {


//   String initialDropdownValue = 'Sq Ft.';

//   List<String> areaUnit = ['Sq Ft.' , 'Marala', 'Acre'];
  
//   File? image;
//   List<File>? multipleImages = [];

//       final imagePicker =  new ImagePicker();
  

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.blue,
//       backgroundColor: Colors.white,
//       body: 
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
// Row(children: [
//  Container(
//           width: MediaQuery.of(context).size.width * 0.7,
//           child: TextField(
//             decoration: InputDecoration(hintText: 'Enter text'),
//           ),
//         ),

//         // Container with Dropdown
//         Container(
//           width: MediaQuery.of(context).size.width * 0.3,
//           child: DropDownButton()
//         ),

// ],)
       
//           // Center(child: DropDownButton())

//           // for drop down

//             // Center(
//             //   child: 
//             //   DropdownButton( 
                  
//             //     // Initial Value 
//             //     value: initialDropdownValue, 
                  
//             //     // Down Arrow Icon 
//             //     icon: const Icon(Icons.keyboard_arrow_down),     
                  
//             //     // Array list of items 
//             //     items: areaUnit.map((String items) { 
//             //       return DropdownMenuItem( 
//             //         value: items, 
//             //         child: Text(items), 
//             //       ); 
//             //     }).toList(), 
//             //     // After selecting the desired option,it will 
//             //     // change button value to selected value 
//             //     onChanged: (String? newValue) {  
//             //       setState(() { 
//             //         initialDropdownValue = newValue!; 
//             //       }); 
//             //     }, 
//             //   ),
           
           
//             // ), 

//           // for image picker
// //             image != null ? Image.file(
// //             image!,
// //             height: 160,
// //             width: 160,
// //             fit: BoxFit.cover,
// //           )  :Container(
// //             color: Colors.red,
// //               height: 160,
// //             width: 160,),

// //             SizedBox(height: 12,)
// // ,          
        
// //           ElevatedButton(onPressed: () async{
// //             // pickMultipleImage();
// //             final List<XFile>? imagePicked =await imagePicker.pickMultiImage();
// //       setState(() {
// //       multipleImages = imagePicked!.map((e) => File(e.path)).toList();
// //       });
// //             // pickImage();
// //           }, child: Text('Add multiple images')),
// //           Expanded(
// //             child: GridView.builder(
// //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
// //               itemCount: multipleImages!.length,
// //               itemBuilder: (context , index){
// //                 return GridTile(child: Image.file(multipleImages![index]));
           
// //             }),
// //           )
        
//         ],
//       ),
  
  
//     );
//   }

// // pickMultipleImage(){

// //     // selectedImages

// //       final imagePicker =  new ImagePicker();
  
// //     // List<XFile> selectedImagesList = [];
// //     void selectedMultipleImages() async {
// //       final List<XFile>? imagePicked = await imagePicker.pickMultiImage();
// //       setState(() {
// //       multipleImages = imagePicked!.map((e) => File(e.path)).toList();
// //       });
// //       // if(selectedImage!.isNotEmpty){
// //       //   selectedImage.addAll(selectedIm);

// //       // } 
// //     }
  

// // }

// //   Future pickImage() async{
// //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
// //     try{
// //        if (image == null){
// //         return 'No image';
// //       // return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('No image selected')) );
// //     }else{

// //       // final imageTemporary = File(image.path);
// //       final imagePermanent = await saveImagePermanently (image.path);
// //       setState(() {
// //         this.image = imagePermanent;
// //       });
// //     }
// //     }on PlatformException catch (e){
// //       print('Failed to pick image $e');
// //     } }


// //   Future<File> saveImagePermanently(String imagePath) async{
// //     final directory = await getApplicationDocumentsDirectory();
    
// //     final name = basename(imagePath);
// //     final image = File('${directory.path}/$name');
// //   return File(imagePath).copy(image.path);
// //   }
  


// } 




        // description

// class test extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Draggable Bottom Sheet Example'),
//       ),
//       body: Center(
//         child: ContainerButton(), // Using the ContainerButton widget
//       ),
//     );
//   }
// }

// class ContainerButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showModalBottomSheet(
//           context: context,
//           isScrollControlled: true,
//           builder: (context) => DraggableBottomSheet(),
//         );
//       },
//       child: Container(
//         padding: EdgeInsets.all(16.0),
//         decoration: BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: Text(
//           'Tap to open bottom sheet',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }

// class DraggableBottomSheet extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       expand: false,
//       builder: (BuildContext context, ScrollController scrollController) {
//         return Container(
//           color: Colors.white,
//           child: ListView.builder(
//             controller: scrollController,
//             itemCount: 50,
//             itemBuilder: (BuildContext context, int index) {
//               return ListTile(
//                 title: Text('Item $index'),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }


     //     Searching

/* 

  class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {

  TextEditingController searchQueryController = TextEditingController();

  

    List<String> items = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grapes',
    'Honeydew',
    'Kiwi',
    'Lemon',
  ];

  List<String> filteredItems = [];



    // List<String> searchResults = [];

void FilteredItems(String query){

  setState(() {
    filteredItems = items.where((element) => element.toLowerCase().contains(query.toLowerCase())).toList();

  });

}


@override
  void initState() {
    
    filteredItems = items;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 195, 98, 98),
      body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        //   TextFormField(
        //     // controller: searchQueryController, 
        //     decoration: InputDecoration(
        //     labelText: 'Search',
        //     border: OutlineInputBorder(),
        //     prefixIcon: Icon(Icons.search),
        // ),
        // onChanged: FilteredItems,
        // ),
        // Expanded(child:
         
        //  ListView.builder(
        //   itemCount: filteredItems.length,
        //   itemBuilder: (context , index ){
        //   return ListTile(
        //       title: Text(filteredItems[index]),
        //   );
        // }))
        // //  Expanded(
        // //   child: ListView.builder(
        // //     itemCount: filteredCities.length,
        // //     itemBuilder: (context, index) {
        // //       return ListTile(
        // //         title: Text(filteredCities[index].name),
        // //         subtitle: Text(filteredCities[index].country),
        // //       );
        // //     },
        // //   ),)         

              //  AddCityBottomSheet(citiesList: citiesList, height: height * 1.4, width: width),
      ],),
    );
 }

//  onSearch(String query){
//   searchResults = data.where((data) {
//     final allData = data.toLowerCase();
//     final input = query.toLowerCase();
  
//     return allData.contains(input);
//   }).toList();

//   setState(() {
//     filteredData = searchResults;
//   });
//  }
}   

*/

