import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ugp_clone/models/station.dart';
import 'package:ugp_clone/routes/home_screen/route.dart';
import 'package:ugp_clone/utils/app_styles.dart';

class UnitStationItem extends StatelessWidget{
  final Station station;

  const UnitStationItem({
    super.key,
    required this.station
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.pushNamed(
        context, 
        RouteGenerator.googleMapsScreen,
        arguments: Marker(
            markerId: MarkerId("${station.id}"), 
            infoWindow: InfoWindow(title: station.name, snippet: station.details),
            position: LatLng(station.latitude, station.longitude))
        ),
      child:Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2, // How much the shadow spreads
            blurRadius: 2, // How blurry the shadow is
            offset: Offset(0, 3), // X and Y offset of the shadow
          ),
        ],
        borderRadius: BorderRadius.circular(6)
      ),

      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              station.name,
              style: AppStyles.normalBlackTextStyle,
            ),
            const SizedBox(height: 5,),
            Text(
              "Details: ${station.details}",
              style: AppStyles.smallGreyTextStyle,
            ),

            Text(
              "CID: ${station.cid}",
              style: AppStyles.smallGreyTextStyle,
            ),

            Text(
              "Counter Phone: ${station.counter}",
              style: AppStyles.smallGreyTextStyle,
            ),

            Text(
              "Traffic: ${station.traffic}",
              style: AppStyles.smallGreyTextStyle,
            ),

            
          ],
        ) 
        
    ));
  }
}