
import 'package:HumaraGhar/view-model/MultiValues_Dialog_Controller/otherFeaturesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherDialog extends StatelessWidget {
  final String dialogTitle;
  final List<String> items;
  
  OtherDialog({
    Key? key,
    required this.items, required this.dialogTitle,
  }) : super(key: key);

  final MultipleOtherFeaturesController otherFeaturesController = Get.put(MultipleOtherFeaturesController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog( 
      title: Text(dialogTitle , style: TextStyle(fontWeight: FontWeight.w600),),
      content: SingleChildScrollView(
        child: Obx(
         () => ListBody(
            children: items.map(
              (item) => CheckboxListTile(
                value: otherFeaturesController.selectedFeatures.contains(item),
                title: Text(item),
                controlAffinity: ListTileControlAffinity.platform,
                onChanged: (isChecked) => otherFeaturesController.itemChange(item, isChecked!),
              ),
            ).toList(),
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: otherFeaturesController.cancel, child: Text('Cancel')),
        ElevatedButton(onPressed: otherFeaturesController.onSubmit, child: Text('Submit'))
      ],
    );
  }
}