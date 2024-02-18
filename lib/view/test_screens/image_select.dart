// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class MyImagePickerScreen extends StatefulWidget {
//   @override
//   _MyImagePickerScreenState createState() => _MyImagePickerScreenState();
// }

// class _MyImagePickerScreenState extends State<MyImagePickerScreen> {
//   List<String> selectedImages = [];
//   final ImagePicker _imagePicker = ImagePicker();

//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await _imagePicker.pickImage(source: source);

//     if (pickedFile != null) {
//       setState(() {
//         selectedImages.add(pickedFile.path);
//       });

//       if (selectedImages.length >= 5) {
//         // Hide the add icon container
//         // You can use a boolean variable to conditionally hide/show the container.
//       }
//     }
//   }

//   Future<void> _showFullSizeImage(String imagePath) async {
//     await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           child: Container(
//             padding: EdgeInsets.all(16),
//             child: Image.file(
//               File(imagePath),
//               fit: BoxFit.cover,
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Image Picker Example'),
//       ),
//       body: Column(
//         children: [
//           // Add icon container
         
//           // Use a conditional widget (like Visibility) to show/hide this container
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               // Open image picker
//               _pickImage(ImageSource.gallery);
//             },
//           ),
//           // Display selected images in a row
//           Row(
//             children: selectedImages.map((imagePath) {
//               return GestureDetector(
//                 onTap: () {
//                   // Show full-size image
//                   _showFullSizeImage(imagePath);
//                 },
//                 child: Container(
//                   margin: EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.black),
//                   ),
//                   child: Image.file(
//                     File(imagePath),
//                     width: 100,
//                     height: 100,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//           // Display image count
//           GestureDetector(
//             onTap: () {
//               // Open full-size image view
//               // You can implement this based on your requirements.
//             },
//             child: Container(
//               margin: EdgeInsets.all(8),
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: Colors.black),
//               ),
//               child: Text('Total Images: ${selectedImages.length}'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





//////////////////////////////////////////////////
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class MyImagePickerScreen extends StatefulWidget {
//   @override
//   _MyImagePickerScreenState createState() => _MyImagePickerScreenState();
// }

// class _MyImagePickerScreenState extends State<MyImagePickerScreen> {
//   List<String> selectedImages = [];
//   final ImagePicker _imagePicker = ImagePicker();

//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await _imagePicker.pickImage(source: source);

//     if (pickedFile != null) {
//       setState(() {
//         selectedImages.add(pickedFile.path);
//       });

//       if (selectedImages.length >= 4) {
//         // If 4 images are selected, navigate to the next screen or perform any action
//         // You can replace this with your navigation logic
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => NextScreen(selectedImages)),
//         );
//       }
//     }
//   }

//   void _deleteImage(int index) {
//     setState(() {
//       selectedImages.removeAt(index);
//     });
//   }

//   Future<void> _showFullSizeImage(String imagePath) async {
//     await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           child: Container(
//             width: double.infinity,
//             padding: EdgeInsets.all(16),
//             child: Image.file(
//               File(imagePath),
//               fit: BoxFit.cover,
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Image Picker Example'),
//       ),
//       body: Column(
//         children: [
//           // Display selected images in a horizontally scrollable row
//           Container(
//             height: 120,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: selectedImages.length,
//               itemBuilder: (context, index) {
//                 return Stack(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         _showFullSizeImage(selectedImages[index]);
//                       },
//                       child: Container(
//                         margin: EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(color: Colors.black),
//                         ),
//                         child: Image.file(
//                           File(selectedImages[index]),
//                           width: 100,
//                           height: 100,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 0,
//                       right: 0,
//                       child: IconButton(
//                         icon: Icon(Icons.delete),
//                         onPressed: () {
//                           _deleteImage(index);
//                         },
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//           // Display "More Pictures" container if more than 4 images are selected
//           if (selectedImages.length > 4)
//             GestureDetector(
//               onTap: () {
//                 // Open full-size image view or perform any other action
//                 // You can implement this based on your requirements.
//               },
//               child: Container(
//                 margin: EdgeInsets.all(8),
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: Colors.black),
//                 ),
//                 child: Text('More Pictures'),
//               ),
//             ),
//           // Add icon container
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               // Open image picker
//               _pickImage(ImageSource.gallery);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NextScreen extends StatelessWidget {
//   final List<String> selectedImages;

//   NextScreen(this.selectedImages);

//   @override
//   Widget build(BuildContext context) {
//     // Implement the UI for the next screen here using selectedImages
//     // ...
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Next Screen'),
//       ),
//       body: Container(
//         // Your next screen UI
//         // ...
//       ),
//     );
//   }
// }

/* 
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyImagePickerScreen extends StatefulWidget {
  const MyImagePickerScreen({super.key});

  @override
  State<MyImagePickerScreen> createState() => _MyImagePickerScreenState();
}

class _MyImagePickerScreenState extends State<MyImagePickerScreen> {

 final ImagePicker _imagePicker = ImagePicker();
  
bool isSelelected = false;

  List<XFile> selectedImages = [];
  Future<void> selectedMultipleImages() async {
  final List<XFile>? imagesSelect = await _imagePicker.pickMultiImage();
  if(imagesSelect!.isNotEmpty){
    selectedImages.addAll(imagesSelect);
  } 
  setState(() {
    isSelelected = true;
  });
   } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    appBar: AppBar(
      title: Text('Image picker'),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: InkWell(
            onTap: (){
              selectedMultipleImages();
            },
            child: Container(
              height: 100,
              width: 90,
              decoration: BoxDecoration(
              border:Border.all(
              ) ,
              borderRadius: BorderRadius.circular(12) 
              ),
              child: Center(
                child: Icon(Icons.add),
              ),
            ),
          ),
        ),
        if(isSelelected)
        Container(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: selectedImages.length,
            itemBuilder: (context , index){
              return InkWell(
          onTap: (){
          },
          child: Container(
            height: 100,
            width: 90,
            decoration: BoxDecoration(
            border:Border.all(
            ) ,
            borderRadius: BorderRadius.circular(12) 
            ),
            child: Image.asset(selectedImages[index].path)
          ),
          );
            }),
        )
        
      ],
    ),

    );
  }

}

*/

 /**        Perfectly running code  */
import 'dart:io';
import 'package:HumaraGhar/view/test_screens/photo_view_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyImagePickerScreen extends StatefulWidget {
  const MyImagePickerScreen({super.key});

  @override
  State<MyImagePickerScreen> createState() => _MyImagePickerScreenState();
}

class _MyImagePickerScreenState extends State<MyImagePickerScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  bool isSelected = false;
  List<XFile> selectedImages = [];
  // Future<void> selectMultipleImages() async {
  //   final List<XFile>? imagesSelected = await _imagePicker.pickMultiImage();

  //      // Check if the total number of selected images exceeds 10
  //     if (selectedImages.length > 10) {
  //       // Trim the list to the first 10 images
  //       selectedImages = selectedImages.sublist(0, 9);
  //     }
    
  //   if (imagesSelected != null && imagesSelected.isNotEmpty) {
  //     setState(() {
  //       selectedImages.addAll(imagesSelected);
  //       isSelected = true;
  //     });
  //   }
  // }


// new

Future<void> selectMultipleImages() async {
  final List<XFile>? imagesSelected = await _imagePicker.pickMultiImage();

  if (imagesSelected != null && imagesSelected.isNotEmpty) {
    // Check if adding the new images will exceed the limit of 10
    if (selectedImages.length + imagesSelected.length > 10) {
      // Calculate the number of images that can be added without exceeding the limit
      final int remainingSlots = 10 - selectedImages.length;

      // Add only the first "remainingSlots" images from the newly selected images
      selectedImages.addAll(imagesSelected.sublist(0, remainingSlots));
    } else {
      // If adding the new images won't exceed the limit, add all of them
      selectedImages.addAll(imagesSelected);
    }

    setState(() {
      isSelected = true;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                selectMultipleImages();
              },
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(Icons.add , color: const Color.fromARGB(255, 55, 54, 54),  size: 30,),
                ),
              ),
            ),
          ),
          if (isSelected)
            Container(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: selectedImages.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    
                    onTap: () {
                    setState(() {
                      
                    });
                    
                      // You can add functionality when tapping on the selected image.
                    Navigator.push(context, MaterialPageRoute(builder: (_) => PhotoViewPage(
                      photos: selectedImages , index: index)));
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      // height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(selectedImages[index].path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
        ],
      
    );
  }
}
