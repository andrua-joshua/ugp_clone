import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ugp_clone/models/lost_and_found.dart';
import 'package:ugp_clone/models/missing_person.dart';
import 'package:ugp_clone/routes/google_maps_screen/google_maps_screen.dart';
import 'package:ugp_clone/routes/home_screen/home_screen.dart';
import 'package:ugp_clone/routes/login_screen/login_screen.dart';
import 'package:ugp_clone/routes/lost_and_found_screen/lost_and_found_screen.dart';
import 'package:ugp_clone/routes/missing_persons_screen/missing_persons_screen.dart';
import 'package:ugp_clone/routes/report_crime_screen/report_crime_screen.dart';
import 'package:ugp_clone/routes/search_stations_screen/search_stations_screen.dart';
import 'package:ugp_clone/routes/unit_lost_and_found_screen/unit_lost_and_found_screen.dart';
import 'package:ugp_clone/routes/unit_missing_person_screen/unit_missing_person_screen.dart';

class RouteGenerator{

  static const String loginScreen = "/";
  static const String signUpScreen = "/signupScreen";
  static const String homeScreen = "/homeScreen";
  static const String lostAndFoundScreen = "/lostAndFoundScreen";
  static const String missingPersonsScreen = "/missingPersonsScreen";
  static const String searchStationsScreen = "/searchStationsScreen";
  static const String unitMissingPersonScreen = "/unitMissingPersonScreen";
  static const String unitLostAndFoundItemScreen = "/unitLostAndFoundItemScreen";

  static const String reportCrimeScreen = "/reportCrimeScreen";

  static const String googleMapsScreen = "/googleMapsScreen";
  

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case homeScreen:
          return MaterialPageRoute(
            builder: (_) => const HomeScreen(),);

      case loginScreen:
          return MaterialPageRoute(
            builder: (_) => const LoginScreen(),);

      case googleMapsScreen:
          final maker = settings.arguments as Marker;
          return MaterialPageRoute(
            builder: (_) => GoogleMapsScreen(stationMarker:  maker,),);

      case reportCrimeScreen:
          return MaterialPageRoute(
            builder: (_) => const ReportCrimeScreen(),);

      case lostAndFoundScreen:
          return MaterialPageRoute(
            builder: (_) => const LostAndFoundScreen(),);

      case unitLostAndFoundItemScreen:
        final item = settings!.arguments as LostAndFound;
          return MaterialPageRoute(
            builder: (_) =>  UnitLostAndFoundScreen(item: item,));

      case missingPersonsScreen:
          return MaterialPageRoute(
            builder: (_) => const MissingPersonsScreen());

      case unitMissingPersonScreen:
          final person = settings!.arguments as MissingPerson;
          return MaterialPageRoute(
            builder: (_) => UnitMissingPersonScreen(person: person,));

      case searchStationsScreen:
          return MaterialPageRoute(
            builder: (_) => const SearchStationsScreen());
      
      default:
        return MaterialPageRoute(
          builder: (_)=> const HomeScreen());
    }
  }

}