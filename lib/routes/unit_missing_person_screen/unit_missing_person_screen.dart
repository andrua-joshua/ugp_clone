import 'package:flutter/material.dart';
import 'package:ugp_clone/models/missing_person.dart';
import 'package:ugp_clone/utils/app_colors.dart';
import 'package:ugp_clone/utils/app_fontsize.dart';
import 'package:ugp_clone/utils/app_styles.dart';

class UnitMissingPersonScreen extends StatefulWidget{
  final MissingPerson person;
  const UnitMissingPersonScreen({super.key, required this.person});



  @override
  UnitMissingPersonScreenState createState()=> UnitMissingPersonScreenState();
}


class UnitMissingPersonScreenState extends State<UnitMissingPersonScreen>{


  final String description = "The [overflow] property's behavior is affected by the [softWrap] argument. If the [softWrap] is true or null, the glyph causing overflow, and those that follow, will not be rendered. Otherwise, it will be shown with the given overflow option.";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context), 
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),

        title: const Text(
          "Person Information",
          style: AppStyles.normalWhiteTextStyle,
        ),
      ),


      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10
          ),

          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40,),
                Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 40,),

                SizedBox(
                  child: Row(
                    children: [
                      const Text(
                        "Name:",
                        style: const TextStyle(
                          fontSize: AppFontsize.normalFontSize,
                          color: Color.fromARGB(255, 87, 86, 86)
                        ),
                      ),
                      const SizedBox(width: 15,),
                      Expanded(
                        child:Text(
                        widget.person.name,
                        style: AppStyles.normalBlackTextStyle,
                        ))
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  "Description:  ${widget.person.description}",
                  style: const TextStyle(
                    fontSize: AppFontsize.normalFontSize,
                    color: Color.fromARGB(255, 87, 86, 86)
                  ),
                )

              ],
            ),
          ),
          
           )),
    );
  }
}