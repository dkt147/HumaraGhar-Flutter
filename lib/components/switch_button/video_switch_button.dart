import 'package:HumaraGhar/components/switch_button/switch_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ShowWithVideoSwitch extends StatelessWidget {
  const ShowWithVideoSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    

    late SwitchController switchController = Get.put(SwitchController());

    return  Obx(() => 
        Switch(
          value: switchController.videoSwitchState.value , 
          onChanged: (value){
                switchController.toggleVideoSwitch();
          })
    );
  }
}

