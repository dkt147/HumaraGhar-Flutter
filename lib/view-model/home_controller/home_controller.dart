

import 'package:get/get.dart';


class HomeController extends GetxController{

   String homeTabName = "Popular";

    RxList<String> homeCategoriesList = [
      'Popular',
      'Type',
      'Location',
      'Area Size',
    ].obs;
  
  
 String plotsTabName = "Type";

    RxList<String> plotsCategoriesList = [
      'Type',
      'Location',
      'Area Size',
    ].obs;
  
String commercialTabName = "Popular";

    RxList<String> commercialCategoriesList = [
      'Popular',
      'Type',
      'Location',
      'Area Size',
    ].obs;
  
  chnageHomeTabCategory(int index){

    homeTabName = homeCategoriesList[index];
  }

  chnagePlotTabCategory(int index){

    plotsTabName = plotsCategoriesList[index];
  }

  
  chnageCommercialTabCategory(int index){

    commercialTabName = commercialCategoriesList[index];
  }
}