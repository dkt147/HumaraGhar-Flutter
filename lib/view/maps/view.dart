import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {

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

  List<Marker> list = const [
    Marker(markerId: MarkerId('1'),
    position:  LatLng(24.853550, 67.124683),
    infoWindow: InfoWindow(
      title: 'Ahmer House'
    )
    ),
    Marker(markerId: MarkerId('2'),
    position:  LatLng(24.953550, 67.124683),
    infoWindow: InfoWindow(
      title: 'Hammad House'
    )
    ),
    Marker(markerId: MarkerId('3'),
    position:  LatLng(24.918570681325264, 67.05867476916991),
    infoWindow: InfoWindow(
      title: 'SAIMS'
    )
    ),
  ];

   setMarker(LatLng value)async{

    latLongVlaue = value;

    List<Placemark> result = await placemarkFromCoordinates(value.latitude, value.longitude);

    if(result.isNotEmpty){
      address = "${result[0].name} , ${result[0].locality}  , ${result[0].administrativeArea} ";
    } 

    print("Area : " + address);

   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _marker.addAll(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _mapInitialPosition,
      // markers: {
      //   Marker(
      //     infoWindow: InfoWindow(title: address),
      //     position: latLongVlaue,
      //     draggable: true,
      //     markerId: MarkerId('1'),
      //     onDragEnd: (value){
      //       setMarker(value);
      //       print(value);
            
      //     }
      //    ),
      //   } ,

      markers: Set<Marker>.of(_marker),
          //         onTap: (value){
          //   setMarker(value);
          // },
      onMapCreated: (GoogleMapController controller){
        _controller.complete(controller);
      },

      ),
      
        // To go to any specific posiion
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        // GoogleMapController controller = await _controller.future;
        // controller.animateCamera(CameraUpdate.newCameraPosition(
        //   CameraPosition(target: LatLng(24.918570681325264, 67.05867476916991),zoom: 14 )
          
        // ));


         // To get latitude and longitude of te location from address
        List<Location> locations = await locationFromAddress("Gronausestraat 710, Enschede");
          // To get address of the location from latitude and longitude
        List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);

        stAddress = locations.last.latitude.toString() + " " + locations.last.longitude.toString();
        stAdd =  placemarks.reversed.last.country.toString(); 

        print(stAdd);
        print(stAddress);
        setState(() { });
      },
      child: Icon(Icons.location_disabled_outlined),),
    );
  }
}