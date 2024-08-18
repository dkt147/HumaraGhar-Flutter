
import 'package:HumaraGhar/view-model/MultiValues_Dialog_Controller/mainFeaturesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainFeaturesDialog extends StatelessWidget {
  final String dialogTitle;
  final List<String> items;
  
  MainFeaturesDialog({
    Key? key,
    required this.items, required this.dialogTitle,
  }) : super(key: key);

  final MultipleMainFeaturesController mainFeaturesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return AlertDialog( 
      title: Text(dialogTitle , style: TextStyle(fontWeight: FontWeight.w600),),
      content: SingleChildScrollView(
        child: Obx(
         () => ListBody(
            children: items.map(
              (item) => CheckboxListTile(
                value: mainFeaturesController.selectedFeatures.contains(item),
                title: Text(item),
                controlAffinity: ListTileControlAffinity.platform,
                onChanged: (isChecked) => mainFeaturesController.itemChange(item, isChecked!),
              ),
            ).toList(),
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: mainFeaturesController.cancel, child: Text('Cancel')),
        ElevatedButton(onPressed: mainFeaturesController.onSubmit, child: Text('Submit'))
      ],
    );
  }
}