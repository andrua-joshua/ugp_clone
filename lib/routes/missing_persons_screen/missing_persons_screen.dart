import 'package:flutter/material.dart';
import 'package:ugp_clone/models/missing_person.dart';
import 'package:ugp_clone/repository/api_repository.dart';
import 'package:ugp_clone/routes/missing_persons_screen/widgets/missing_persons_screen_widgets.dart';
import 'package:ugp_clone/utils/app_colors.dart';
import 'package:ugp_clone/utils/app_styles.dart';

class MissingPersonsScreen extends StatefulWidget{
  const MissingPersonsScreen({super.key});


  @override
  MissingPersonsScreenState createState ()=> MissingPersonsScreenState();

}



class MissingPersonsScreenState extends State<MissingPersonsScreen>{


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
          "Missing Persons",
          style: AppStyles.normalWhiteTextStyle,
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10
          ),

          child: FutureBuilder<List<MissingPerson>>(
            future: ApiRepository().getAllMissingPerson(), 
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
                            data!.length, (x)=> UnitMissingPersonItem(
                              person: data[x],)),
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