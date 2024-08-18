import 'package:flutter/material.dart';
import 'package:HumaraGhar/model/banner_model.dart';
import 'package:HumaraGhar/API/Banner/service.dart';

class BannerImagesView extends StatefulWidget {
  const BannerImagesView({Key? key});

  @override
  State<BannerImagesView> createState() => _BannerImagesViewState();
}

class _BannerImagesViewState extends State<BannerImagesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FutureBuilder<BannerModel>(
          future: HomeServices().fetchBannerImages(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List<Banners>? banners = snapshot.data!.banners;
              return ListView.builder(
                itemCount: banners!.length,
                itemBuilder: (context, index) {
                  return Image.network(banners[index].url ?? '');
                },
              );
            } else {
              return Text('No Data');
            }
          },
        ),
      ),
    );
  }
}