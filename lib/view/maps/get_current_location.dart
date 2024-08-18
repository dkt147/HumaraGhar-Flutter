import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetCurrentLocaton extends StatefulWidget {
  const GetCurrentLocaton({super.key});

  @override
  State<GetCurrentLocaton> createState() => _GetCurrentLocatonState();
}

class _GetCurrentLocatonState extends State<GetCurrentLocaton> {

  LatLng latLongVlaue =   LatLng(24.8555677, 67.2118619);
  String address = "Ahmer House";

  String stAddress = '';
  String  stAdd  = '';

  Completer<GoogleMapController> _controller = Completer();


  static final CameraPosition _mapInitialPosition = const CameraPosition
  (target: LatLng(24.853550, 67.124683),
    zoom: 14
   );

  List<Marker> _marker = [];

  List<Marker> list =  [
    Marker(markerId: MarkerId('1'),
    position:  LatLng(24.853550, 67.124683),
    infoWindow: InfoWindow(
      title: 'Ahmer House'
    )
    ),
  ];

    //

    loadData(){
       // GET LOCATIONS
        getUserCurrentLocation().then((value)async{
          print(value.latitude.toString());
          print(value.longitude.toString());
          print('My location latitude == ${value.latitude.toString()} and longitude == ${value.longitude.toString()} ');

           // Markers 
       _marker.add(Marker(markerId: MarkerId('2'),
      position: LatLng(value.latitude , value.longitude),
      infoWindow: InfoWindow(
        title: 'My Current Location'
      )
       ));
       setState(() {
         
       });
       CameraPosition cameraPosition = CameraPosition(
        zoom: 14,
        target :LatLng(value.latitude , value.longitude ) );

            final GoogleMapController controller = await _controller.future;
        controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
       
        });


    }


  Future<Position> getUserCurrentLocation()async{
    await Geolocator.requestPermission().then((value){

    }).onError((error, stackTrace) {
      print('ERROR' + error.toString());
    });

     return await Geolocator.getCurrentPosition();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _mapInitialPosition,
      markers: Set<Marker>.of(_marker),
      onMapCreated: (GoogleMapController controller){
        _controller.complete(controller);
      },

      ),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        
       
    

      },
      child: Icon(Icons.location_disabled_outlined),),
    );
  }
}