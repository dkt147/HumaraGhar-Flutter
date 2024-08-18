import 'dart:io';
import 'package:HumaraGhar/API/Ads%20Api/post_ad/fullScreenImageGallery.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  List<File> _imageList = [];



  Future<void> _pickImages() async {
    final int totalSelectedImages = _imageList.length;
  if (totalSelectedImages < 5) {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();

    

    if (_imageList.length + pickedImages.length > 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You can only select up to 5 images in total.'),
        ),
      );
      return;
    }
    
    final int remainingSlots = 5 - totalSelectedImages;
    final int imagesToAdd = pickedImages.length > remainingSlots ? remainingSlots : pickedImages.length;


    
    setState(() {
      _imageList.addAll(pickedImages.map((image) => File(image.path)));
    });
    } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You can pick a maximum of 5 images.'),
      ),
    );
  }
  }

  // Function to remove image from the list
  void _removeImage(int index) {
    setState(() {
      _imageList.removeAt(index);
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(_imageList.length < 5)
          InkWell(
            onTap: ()=> _pickImages(),
            child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(color: Colors.amber , borderRadius: BorderRadius.circular(8)),
                child: Icon(Icons.add_a_photo , color: Colors.black,),
            ),
          ),
          // ElevatedButton(
          //   onPressed: _pickImages,
          //   child: Text('Pick Images'),
          // ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _imageList.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                            openGallery(imageList: _imageList, selectedIndex : index );
                            print(index);
                              //  Navigator.push(context, MaterialPageRoute(builder : (context) => FullScreenImageGallery(imageList: _imageList , index: _imageList[index] ,)));
                            //  print('object');
                            //  Navigator.push(context, MaterialPageRoute(builder : (context) => PostAdView()));
  

                          // Show image in fullscreen
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (_) => openGallery()
                            
                          //   // FullScreenImageSwiper(
                          //   //   initialIndex: index,
                          //   //   imageList: _imageList,
                          //   // ),
                          // ));
                        },
                        child: Ink.image(
                          image: FileImage(
                             _imageList[index],
                         ),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          //  Image.file(
                          //   _imageList[index],
                          //   width: 100,
                          //   height: 100,
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => _removeImage(index),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      
    );
  }

  void openGallery({ imageList,required selectedIndex}){
    Navigator.push(context, MaterialPageRoute(builder : (context) => FullScreenImageGallery(imageList: imageList , index: selectedIndex ,)));
  }
}
