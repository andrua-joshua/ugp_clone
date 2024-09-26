import 'package:flutter/material.dart';
import 'package:ugp_clone/routes/home_screen/route.dart';
import 'package:ugp_clone/routes/home_screen/widgets/home_screen_widgets.dart';
import 'package:ugp_clone/utils/app_colors.dart';
import 'package:ugp_clone/utils/cutom_widgets.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});


  @override
  HomeScreenState createState() => HomeScreenState();
  
}


class HomeScreenState extends State<HomeScreen>{

  final List<String> items = const [
    "REPORT CRIME",
    "EPS TICKETS",
    "LOST AND FOUND",
    "MISSING PERSONS",
    "SEARCH STATION",
    "NEAR BY STATION"
  ];  


  

  @override
  Widget build(BuildContext context) {
    final List<Function()> functions = [
    ()=> Navigator.pushNamed(context, RouteGenerator.reportCrimeScreen),
    (){},
    ()=> Navigator.pushNamed(context, RouteGenerator.lostAndFoundScreen),
    ()=> Navigator.pushNamed(context, RouteGenerator.missingPersonsScreen),
    ()=> Navigator.pushNamed(context, RouteGenerator.searchStationsScreen),
    (){},
  ];

    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: AppColors.softWhiteColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeTopWidget(),
                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      
                      double width = constraints.maxWidth*0.48;

                      return DGridWidget(
                          colCount: 2,
                          children: List.generate(
                            items.length, (x)=> UnitHomeItem(
                            label: items[x], 
                            onclick: functions[x],
                            width: width)));
                    },)
                )

              ],
            ),
          ),
        )
        
        ),
    );
  }
}