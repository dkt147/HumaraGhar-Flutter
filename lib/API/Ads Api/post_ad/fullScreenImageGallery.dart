// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class FullScreenImageView extends StatelessWidget {
//   final int initialIndex;
//   final List<File> imageList;

//   FullScreenImageSwiper({required this.initialIndex, required this.imageList});

//   @override
//   Widget build(BuildContext context) {
//     return
//     Row(
//       children: [
//         Expanded(
//           child: ListView.builder(
//             itemCount: imageList.length,
//             itemBuilder: (context , index){
//               return Container(
//                 height: 80,
//                 width: 60,
//                  child : Image.file(
//                   imageList[index],
//                   fit: BoxFit.cover,
//                 )
//               );
//           }),
//         ),
//       ],
//     );
//   }
// }

import 'dart:io';

import 'package:HumaraGhar/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FullScreenImageGallery extends StatefulWidget {
  final List<File> imageList;
  final int index;
  final PageController pageController;
  FullScreenImageGallery({
    super.key,
    required this.imageList,
    this.index = 0,
  }) : pageController = PageController(initialPage: index);

  @override
  State<FullScreenImageGallery> createState() => _FullScreenImageGalleryState();
}

class _FullScreenImageGalleryState extends State<FullScreenImageGallery> {
  late int index = widget.index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        PhotoViewGallery.builder(
          pageController: widget.pageController,
          itemCount: widget.imageList.length,
          builder: (context, index) {
            var image = widget.imageList[index];
            return PhotoViewGalleryPageOptions(
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.contained * 4,
                imageProvider: FileImage(image));
          },
          onPageChanged: (index) => setState(() => this.index = index),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, bottom: 20),
          child: Container(
            decoration: BoxDecoration(color: Colors.grey),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              child: Text(
                '${index + 1}/${widget.imageList.length}',
                style: GoogleFonts.robotoFlex(
                    color: Colors.white,
                    fontSize: 24,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
        )
      ],
    );
  }
}
