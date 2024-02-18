
import 'package:get/get.dart';

class ProjectController extends GetxController{

     List<dynamic> imageList = [
    // widget.imageUrl,
   'assets/houses/house2.jpg',
    'assets/houses/house4.jpg',
    'assets/houses/house6.jpg',
  ].obs;


    final RxInt currentIndex = 0.obs ;


    void changeCurrentIndex(int index){
      print(index);
      currentIndex.value = index;
      print(currentIndex);
    }
}