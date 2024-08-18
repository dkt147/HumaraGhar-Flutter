
import 'package:HumaraGhar/view-model/MultiValues_Dialog_Controller/nearbyLocationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NearbyDialog extends StatelessWidget {
  final String dialogTitle;
  final List<String> items;
  
  NearbyDialog({
    Key? key,
    required this.items, required this.dialogTitle,
  }) : super(key: key);

  final MultipleNearbyLocationsController nearbyLocationController = Get.put(MultipleNearbyLocationsController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog( 
      title: Text(dialogTitle , style: TextStyle(fontWeight: FontWeight.w600),),
      content: SingleChildScrollView(
        child: Obx(
         () => ListBody(
            children: items.map(
              (item) => CheckboxListTile(
                value: nearbyLocationController.selectedFeatures.contains(item),
                title: Text(item),
                controlAffinity: ListTileControlAffinity.platform,
                onChanged: (isChecked) => nearbyLocationController.itemChange(item, isChecked!),
              ),
            ).toList(),
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: nearbyLocationController.cancel, child: Text('Cancel')),
        ElevatedButton(onPressed: nearbyLocationController.onSubmit, child: Text('Submit'))
      ],
    );
  }
}