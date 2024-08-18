import 'package:HumaraGhar/API/latest_projects/model.dart';
import 'package:flutter/material.dart';

class latesProjectDetailView extends StatefulWidget {
  final Project projectDetails;
  const latesProjectDetailView({super.key, required this.projectDetails});

  @override
  State<latesProjectDetailView> createState() => _latesProjectDetailViewState();
}

class _latesProjectDetailViewState extends State<latesProjectDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Detail View'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.projectDetails.name.toString()),
            Container(child: Image.network(widget.projectDetails.attachmentUrl.toString()),)
          ],
        ),
      ),
    );
  }
}