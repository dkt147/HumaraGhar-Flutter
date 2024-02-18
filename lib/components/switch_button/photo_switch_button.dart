import 'package:HumaraGhar/components/switch_button/switch_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowWithPhototSwitch extends StatelessWidget {
  const ShowWithPhototSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    late SwitchController switchController = Get.put(SwitchController());

    return Obx(
      () => Switch(
          value: switchController.photoSwitchState.value,
          onChanged: (value) {
            switchController.togglePhotoSwitch();
          }),
    );
  }
}

