import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ugp_clone/models/station.dart';
import 'package:ugp_clone/repository/api_repository.dart';

class AllStationsScreen extends StatefulWidget{

  const AllStationsScreen({super.key});


  @override
  AllStationsScreenState createState()=> AllStationsScreenState();

}

class AllStationsScreenState extends State<AllStationsScreen>{

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late final CameraPosition _kGooglePlex;

  late final CameraPosition _kLake;

  
  @override
  void initState() {
    super.initState();

    _kGooglePlex = const CameraPosition(
      target:  LatLng(0.3491314, 32.6621247),
      zoom: 14.4746,
    );
  }
      

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Station>>(
        future: ApiRepository().getAllStatations(), 
        builder: (context, snapshot) {
          
          if(snapshot.hasData){
            final data =  snapshot.data;

            return GoogleMap(
              mapType: MapType.hybrid,
              markers: Set<Marker>.from(parkingToMarker(data??[])),
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              
            );
          }

          if(snapshot.hasError){
            return const SizedBox(height: 70, child: Center(child:Text("Failed to fetch Parkings")),);
          }



          return const Center(
            child: SizedBox(
              height: 40, width: 40,
              child: CircularProgressIndicator(),
              ),
          );
        },)
      
      
      
    );
  }

  List<Marker> parkingToMarker(List<Station> stations)
    => stations.map(
      (element)=> Marker(
        markerId: MarkerId("${element.id}"),
        position: LatLng(element.latitude,element.longitude),
        infoWindow: InfoWindow(
          title: element.name,
          snippet: element.details
        ))
    ).toList();

}