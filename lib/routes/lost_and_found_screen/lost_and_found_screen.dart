import 'package:flutter/material.dart';
import 'package:ugp_clone/models/lost_and_found.dart';
import 'package:ugp_clone/repository/api_repository.dart';
import 'package:ugp_clone/routes/lost_and_found_screen/widgets/lost_and_found_widgets.dart';
import 'package:ugp_clone/utils/app_colors.dart';
import 'package:ugp_clone/utils/app_styles.dart';

class LostAndFoundScreen extends StatefulWidget{
  const LostAndFoundScreen({super.key});



  @override
  LostAndFoundScreenState createState() => LostAndFoundScreenState();
  
}


class LostAndFoundScreenState extends State<LostAndFoundScreen>{

  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }


  @override 
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context), 
          icon: const Icon(
            Icons.arrow_back, color: Colors.white,
          )),

        title: const Text(
          "Missing Property",
          style: AppStyles.normalWhiteTextStyle,
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10
          ),

          child: FutureBuilder<List<LostAndFound>>(
            future: ApiRepository().getAllLostAndFound(), 
            builder: (context, snapshot) {

              if(snapshot.hasData){
                final data = snapshot.data;

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      Container(
                        constraints: const BoxConstraints.expand(height: 50),
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
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: searchController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search by name",
                                  hintStyle: AppStyles.smallBlackTextStyle
                                ),
                              )),

                            const SizedBox(width: 15,),
                            const Icon(
                              Icons.search, color: Colors.grey,
                              size: 30,
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 20,),
                      SizedBox(
                        child: Column(
                          children: List.generate(
                            data!.length , (x)=> UnitMissingPropertyItem(
                              item: data[x],)),
                        ),
                      )
                    ],
                  ),
                );
              }

              if(snapshot.hasError){
                return const Center(child:Text("Failed to load data", style: AppStyles.normalGreyTextStyle,));
              }
              
              return const Center(
                child: CircularProgressIndicator(),
              );
            },),
          
           )),
    );
  }
}