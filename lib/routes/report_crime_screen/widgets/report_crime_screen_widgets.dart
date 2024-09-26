import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ugp_clone/utils/app_colors.dart';
import 'package:ugp_clone/utils/app_styles.dart';

class Selectablewidgets extends StatefulWidget{
  final Function(String) selected;
  const Selectablewidgets({super.key, required this.selected});


  @override
  SelectablewidgetsState createState() => SelectablewidgetsState();
}


class SelectablewidgetsState extends State<Selectablewidgets>{

  int currentIndex = 0;

  final List<String> labels = const [
    "Crime",
    "Complaint"
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {

        double width = constraints.maxWidth*0.45;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            2, (x)=> GestureDetector(
              onTap: (){
                setState(() {
                  currentIndex = x;
                  widget.selected(labels[x]);
                });
              },
              child:unitSelectable(
              label: labels[x], 
              width: width,
              colors: x==currentIndex? AppColors.primaryColor: Colors.white, 
              style: x==currentIndex? AppStyles.normalWhiteTextStyle:AppStyles.normalBlackTextStyle ))),
        );
      },);
  }


  Widget unitSelectable({
    required String label,
    required Color colors,
    required double width,
    required TextStyle style
  }) => Container(
    height: 45,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: colors
    ),
    child: Center(
      child: Text(label, style: style,),
    ),
  ); 


}



class DetailsEntryWidget extends StatefulWidget{
  final TextEditingController controller;

  const DetailsEntryWidget({
    super.key,
    required this.controller});

  @override
  DetailsEntryWidgetState createState() => DetailsEntryWidgetState();

}



class DetailsEntryWidgetState extends State<DetailsEntryWidget>{


  bool isRecording = false;
  bool isRecorded  = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1
            ),
            borderRadius: BorderRadius.circular(10)
          ),
          padding: const EdgeInsets.all(6),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                controller: widget.controller,
                style: AppStyles.normalBlackTextStyle,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Details",
                  hintStyle: AppStyles.normalGreyTextStyle,
                ),
              )),

          IconButton(
            onPressed: (){
              setState(() {
                // isRecording == true? isRecorded =true: isRecorded =false;
                // isRecording = !isRecording;
              });
            }, 
            icon: Icon(
              isRecording? Icons.stop: Icons.mic))
            ],
          ),
        ),
        const SizedBox(height: 5,),
        isRecording? SizedBox(
          width:double.infinity,
          child: Image.asset("assets/images/wave.gif", fit: BoxFit.fitWidth,),
        ):  isRecorded? 
        SizedBox(
          child: Row(
            children: [
              const SizedBox(width: 15,),
              const Expanded(
                child: Divider(thickness: 3, color: AppColors.primaryColor,)),
              
              const SizedBox(width: 10,),
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.play_arrow))
            ],
          ),
        ) : const SizedBox()
      ],
    );
  }
}



