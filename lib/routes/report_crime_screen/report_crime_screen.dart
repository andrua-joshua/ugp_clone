import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ugp_clone/provider/user_provider.dart';
import 'package:ugp_clone/repository/api_repository.dart';
import 'package:ugp_clone/repository/geolocation_service.dart';
import 'package:ugp_clone/routes/report_crime_screen/widgets/report_crime_screen_widgets.dart';
import 'package:ugp_clone/utils/app_colors.dart';
import 'package:ugp_clone/utils/app_fontsize.dart';
import 'package:ugp_clone/utils/app_styles.dart';
import 'package:ugp_clone/utils/app_text_input_fields.dart';
import 'package:ugp_clone/utils/buttons.dart';
import 'package:ugp_clone/utils/cutom_widgets.dart';

class ReportCrimeScreen extends StatefulWidget{
  const ReportCrimeScreen({super.key});


  @override
  ReportCrimeScreenState createState ()=> ReportCrimeScreenState();
}



class ReportCrimeScreenState extends State<ReportCrimeScreen>{

  late final TextEditingController categoryController;
  late final TextEditingController detailsController;
  XFile? file;

  bool isGettingFile = false;
  bool isLoading = false;
  String type = "Crime";
  List<String> categories = [
    "Murder",
    "Theft",
    "Domestic Violence",
  ];

  int index = 0;



  @override
  void initState() {
    super.initState();
    categoryController = TextEditingController();
    detailsController = TextEditingController();
  }



  @override
  void dispose() {
    super.dispose();
    categoryController.dispose();
    detailsController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context), 
          icon: const Icon(Icons.arrow_back, color: Colors.white,)),
        title: const Text(
          "Report a Crime", style: AppStyles.titleBoldWhiteTextStyle,),
      ),


      body: Consumer<UserProvider>(
        builder: (context, value, child)
         => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30,),
                Selectablewidgets(
                  selected: (str){
                    setState(() {
                      type = str;
                    });
                  },
                ),
                const SizedBox(height: 70,),
                DOutlinedTextInputField(
                  hintText: "Category", 
                  hintTextStyle: AppStyles.normalGreyTextStyle, 
                  valueTextStyle: AppStyles.normalBlackTextStyle, 
                  borderColor: Colors.grey, 
                  borderRadius: 10, 
                  btnHeight: 50, 
                  controller: categoryController),

                const SizedBox(height: 20,),
                DetailsEntryWidget(controller: detailsController),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: ()async{
                    setState(() {
                      isGettingFile = true;
                    });
                    file = await  ImagePicker().pickMedia();
                    setState(() {
                      isGettingFile = false;
                    });
                  },
                  child:Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10)
                  ),

                  child: Row(
                    children: [
                      const SizedBox(width: 10,),
                      Icon(Icons.attach_file_outlined, color: Colors.white,),
                      const SizedBox(width: 10,),
                      Expanded(
                        child:Text(
                          isGettingFile?"Loading file..." :
                          file!=null?file!.name:"Attach file", style: AppStyles.normalWhiteTextStyle,)),
                      const SizedBox(width: 10,),
                    ],
                  ),
                )),

                const SizedBox(height: 60,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: isLoading?
                  const Center(child:SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(),))
                  : DSolidButton(
                  label: "Submit", 
                  btnHeight: 45, 
                  bgColor: AppColors.primaryColor, 
                  borderRadius: 10, 
                  textStyle: AppStyles.normalWhiteTextStyle, 
                  onClick: ()=> report(value, context))),

                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child:DOutlinedButton(
                  label: "Emergency", 
                  btnHeight: 45, 
                  borderColor: Colors.red, 
                  borderRadius: 10, 
                  textStyle: const TextStyle(
                    fontSize: AppFontsize.normalFontSize,
                    color: Colors.red
                  ), 
                  onClick: (){
                    showModalBottomSheet(
                      isScrollControlled: true,
                      showDragHandle: true,
                      context: context, 
                      builder: (context)
                       => Container(
                        padding: const EdgeInsets.all(10),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            
                            double width= constraints.maxWidth*0.48;
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children:[
                                const Text("Select Emergency type", style: AppStyles.normalBlackTextStyle,),
                                const SizedBox(height: 10,),
                                DGridWidget(
                              colCount: 2,
                              children: List.generate(
                                  categories.length, 
                                  (x)=> GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        index = x;
                                        type = "Emergency";
                                        report(value, context,isEmergency: true);
                                      });
                                    },
                                    child: Container(
                                      width: width,
                                      height: width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5), // Shadow color
                                            spreadRadius: 2, // How much the shadow spreads
                                            blurRadius: 2, // How blurry the shadow is
                                            offset: Offset(0, 3), // X and Y offset of the shadow
                                          ),
                                        ],
                                      ),

                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 70,
                                            width: 80,
                                            color: AppColors.softWhiteColor,
                                          ),
                                          const SizedBox(height: 10,),
                                          Text(
                                            categories[x],
                                            style: AppStyles.smallBlackTextStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ) ), 
                                )]);
                          },),
                       ),);
                  })),

              ],
            ),
          ), )),)
    );
  }


  Future<void> report(UserProvider provider, BuildContext context, {bool isEmergency=false})async{
    setState(() {
      isLoading = true;
    });

    try{
      if(categoryController.text.isNotEmpty || isEmergency){
        print("::::>>> This is the:: Category=>${categories[index]}    :::   type=>$type");
        final location = await GeolocationServiceGeolocatorApi().getCurrentLocation();
        final res = await ApiRepository().makeReport(
        category: isEmergency? categories[index]: categoryController.text, 
        details: detailsController.text.isEmpty? "_empty":detailsController.text, 
        type: type, 
        lastname: provider.user!.lastname, 
        firstname: provider.user!.firstname, 
        lat: location.lat,
        lng: location.long,
        attachment: file,
        phone: provider.user!.phone);

        if(res){
          Fluttertoast.showToast(msg: "Report sent Successfuly");
          Navigator.pop(context);
          isEmergency? Navigator.pop(context): null;
        }else{
          Fluttertoast.showToast(msg: "Report not sent");
        }
      }else{
        Fluttertoast.showToast(msg: "Fill in the category please");
      }


    }catch(err){
      Fluttertoast.showToast(msg: "Failed to send report");
    }

    setState(() {
      isLoading = false;
    });
  }


  


}