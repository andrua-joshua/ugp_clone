import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ugp_clone/provider/user_provider.dart';
import 'package:ugp_clone/routes/google_maps_screen/google_maps_screen.dart';
import 'package:ugp_clone/routes/home_screen/home_screen.dart';
import 'package:ugp_clone/routes/home_screen/route.dart';
import 'package:ugp_clone/routes/login_screen/login_screen.dart';
import 'package:ugp_clone/routes/lost_and_found_screen/lost_and_found_screen.dart';
import 'package:ugp_clone/routes/missing_persons_screen/missing_persons_screen.dart';
import 'package:ugp_clone/routes/report_crime_screen/report_crime_screen.dart';
import 'package:ugp_clone/routes/search_stations_screen/search_stations_screen.dart';
import 'package:ugp_clone/routes/unit_lost_and_found_screen/unit_lost_and_found_screen.dart';
import 'package:ugp_clone/routes/unit_missing_person_screen/unit_missing_person_screen.dart';

void main() {
  runApp(
      ChangeNotifierProvider<UserProvider>(
        create: (_)=> UserProvider(),
        builder: (context, child) => const MyApp(),)
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ugp_clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteGenerator.loginScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      // home: const GoogleMapsScreen(),  
    );
  }
}
