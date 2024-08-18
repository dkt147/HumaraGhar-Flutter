import 'package:HumaraGhar/components/switch_button/switch_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class InstallmentSwitchButton extends StatelessWidget {
  const InstallmentSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    

    SwitchController switchController = Get.put(SwitchController());

    return  Obx(() => 
        Switch(
          value: switchController.installmentSwitchState .value , 
          onChanged: (value){
                switchController.toggleInstallmentSwitch();
          })
    );
  }
}


