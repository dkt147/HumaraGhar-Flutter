
import 'package:get/get.dart';


class SwitchController extends GetxController {
  

          /* Search Screen Switch */

        // For Photo Switch Button

  RxBool photoSwitchState = false.obs; // our observable
  // swap true/false & save it to observable
  void togglePhotoSwitch(){
     photoSwitchState.value = photoSwitchState.value ? false : true;
     }

        // For Video Switch Button

  RxBool videoSwitchState = false.obs; // our observable
  // swap true/false & save it to observable
  void toggleVideoSwitch(){
     videoSwitchState.value = videoSwitchState.value ? false : true;
     }

             /* Post Ad Screen Switch */

            // For Installment Switch Button

  RxBool installmentSwitchState = false.obs; // our observable
  // swap true/false & save it to observable
  void toggleInstallmentSwitch(){
     installmentSwitchState.value = installmentSwitchState.value ? false : true;
     }


              // For possession Switch Button
              
  RxBool possessionSwitchState = false.obs; // our observable
  // swap true/false & save it to observable
  void togglePossessionSwitch(){
     possessionSwitchState.value = possessionSwitchState.value ? false : true;
     }


}