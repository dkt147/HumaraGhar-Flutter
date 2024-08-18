
import 'package:HumaraGhar/view-model/MultiValues_Dialog_Controller/plotFeaturesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlotDialog extends StatelessWidget {
  final String dialogTitle;
  final List<String> items;
  
  PlotDialog({
    Key? key,
    required this.items, required this.dialogTitle,
  }) : super(key: key);

  final MultiplePlotFeaturesController plotFeaturesController = Get.put(MultiplePlotFeaturesController());


  @override
  Widget build(BuildContext context) {
    return AlertDialog( 
      title: Text(dialogTitle , style: TextStyle(fontWeight: FontWeight.w600),),
      content: SingleChildScrollView(
        child: Obx(
         () => ListBody(
            children: items.map(
              (item) => CheckboxListTile(
                value: plotFeaturesController.selectedFeatures.contains(item),
                title: Text(item),
                controlAffinity: ListTileControlAffinity.platform,
                onChanged: (isChecked) => plotFeaturesController.itemChange(item, isChecked!),
              ),
            ).toList(),
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: plotFeaturesController.cancel, child: Text('Cancel')),
        ElevatedButton(onPressed: plotFeaturesController.onSubmit, child: Text('Submit'))
      ],
    );
  }
}