
import 'package:HumaraGhar/dropdown_with_api/area_dropdown_service.dart';
import 'package:get/get.dart';

class AreaDropDownController extends GetxController{


var selectedAreaValue = '200';
var areaDropdownData = [];


final AreaDropdownService  _areaDropdownService = AreaDropdownService(); 

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void fetchAreaList()async{
   try{

   }catch(e){
    print("Error at Drop down list : " + e.toString());
   }
   
    final data = await _areaDropdownService.getAreaSizeData() ;
    areaDropdownData = data.data!;
    update();
  }

}