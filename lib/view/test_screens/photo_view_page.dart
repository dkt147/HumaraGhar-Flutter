
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewPage extends StatelessWidget {
  final List<XFile> photos;
  final int index;
  const PhotoViewPage({super.key, 
  required this.photos, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: PhotoViewGallery.builder(
        itemCount: photos.length, builder: (context,index)
        => PhotoViewGalleryPageOptions.customChild(
          minScale:  PhotoViewComputedScale.covered,
          child: Image.file(File(photos[index].path) ) ),
        pageController: PageController(initialPage: index),
        enableRotation: true,

        ),
    );
  }
}