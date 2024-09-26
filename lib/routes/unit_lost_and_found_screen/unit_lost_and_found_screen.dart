import 'package:flutter/material.dart';
import 'package:ugp_clone/models/lost_and_found.dart';
import 'package:ugp_clone/utils/app_colors.dart';
import 'package:ugp_clone/utils/app_fontsize.dart';
import 'package:ugp_clone/utils/app_styles.dart';

class UnitLostAndFoundScreen extends StatefulWidget{
  final LostAndFound item;
  const UnitLostAndFoundScreen({super.key, required this.item});


  @override
  UnitLostAndFoundScreenState createState() => UnitLostAndFoundScreenState();

}


class UnitLostAndFoundScreenState extends State<UnitLostAndFoundScreen>{





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context), 
          icon: const Icon(Icons.arrow_back, color: Colors.white,)),
        title: const Text(
          "Item Details",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40,),
              Center(
                child: Container(
                  color: Colors.white,
                  height: 180,
                  width: 200
                ),
              ),
              const SizedBox(height: 30,),
              unitInfo(
                label: "Name on Item: ", value: widget.item.nameOnItem),

              unitInfo(
                label: "Property Type: ", value: widget.item.propertyType),

              unitInfo(
                label: "Location: ", value: widget.item.location),

              unitInfo(
                label: "Storage: ", value: widget.item.storage),

              unitInfo(
                label: "Contact Person: ", value: widget.item.contactPerson),

              unitInfo(
                label: "Contact Phone: ", value: widget.item.contactPerson),

              unitInfo(
                label: "Serial Number: ", value: widget.item.serialNo),

              unitInfo(
                label: "Status: ", value: widget.item.status),

              unitInfo(
                label: "Details: ", value: widget.item.details),    
            ],
          ),
        ),
         )),

    );
  }



  Widget unitInfo({
    required String label,
    required String value
  })=> Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child:SizedBox(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth*0.46;
            return Row(
              children: [
                SizedBox(
                  width: width,
                  child:Text(
                  label,
                  style: const TextStyle(
                    fontSize: AppFontsize.normalFontSize,
                    color: Color.fromARGB(255, 87, 86, 86)
                  ),
                )),
                const SizedBox(width: 15,),
                Expanded(
                  child:Text(
                  value,
                  style: AppStyles.normalBlackTextStyle,
                  ))
              ],
            );
          }, ),
      ));
}