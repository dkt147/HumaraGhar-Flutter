
import 'package:get/get.dart';

class BottomNavigationController extends GetxController{


var isLoading = true.obs;

  void changeLoadingState(bool loading) {
    isLoading.value = loading;
    if (loading) {
      // Show loading indicator for 3 seconds
      Future.delayed(Duration(seconds: 3), () {
        isLoading.value = false;
      });
    }
  }

  var selectdIndex = 0.obs;


  void changeIndex(int index){
    selectdIndex.value = index;
  }


}