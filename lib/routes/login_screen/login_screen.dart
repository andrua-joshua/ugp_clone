import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:ugp_clone/models/user.dart';
import 'package:ugp_clone/provider/user_provider.dart';
import 'package:ugp_clone/routes/home_screen/route.dart';
import 'package:ugp_clone/utils/app_colors.dart';
import 'package:ugp_clone/utils/app_styles.dart';
import 'package:ugp_clone/utils/app_text_input_fields.dart';
import 'package:ugp_clone/utils/buttons.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});


  @override
  LoginScreenState createState() => LoginScreenState();
}



class LoginScreenState extends State<LoginScreen>{

  late final TextEditingController firstnameController;
  late final TextEditingController lastNameController;
  late final TextEditingController phoneController;
  late final TextEditingController emailController;



@override
  void initState() {
    super.initState();

    firstnameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
  }


  @override
  void dispose() {
    super.dispose();


    firstnameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softWhiteColor,


      body: Consumer<UserProvider>(
        builder: (context, value, child) {
          return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 80,),
                Center(
                  child:Container(
                  height: 160,
                  width: 160,
                  color: Colors.white,
                )),
              const SizedBox(height: 50,),
              const Text("Welcome to UPF Mobile", style: AppStyles.bigBoldGreyTextStyle,),
              const SizedBox(height: 30,),
              SizedBox(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double width = constraints.maxWidth*0.48;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width,
                          child: DOutlinedTextInputField(
                          hintText: "First Name", 
                          hintTextStyle: AppStyles.normalGreyTextStyle, 
                          valueTextStyle: AppStyles.normalBlackTextStyle, 
                          borderColor: Colors.grey, 
                          borderRadius: 10, 
                          btnHeight: 50, 
                          controller: firstnameController),
                        ),

                      SizedBox(
                          width: width,
                          child: DOutlinedTextInputField(
                          hintText: "Last Name", 
                          hintTextStyle: AppStyles.normalGreyTextStyle, 
                          valueTextStyle: AppStyles.normalBlackTextStyle, 
                          borderColor: Colors.grey, 
                          borderRadius: 10, 
                          btnHeight: 50, 
                          controller: lastNameController),
                        )
                      ],
                    );
                  },),
              ),

              const SizedBox(height: 20,),
              DOutlinedTextInputField(
                hintText: "Phone", 
                hintTextStyle: AppStyles.normalGreyTextStyle, 
                valueTextStyle: AppStyles.normalBlackTextStyle, 
                borderColor: Colors.grey, 
                borderRadius: 10, 
                btnHeight: 50, 
                keyboardType: TextInputType.phone,
                controller: phoneController),

              const SizedBox(height: 20,),
              DOutlinedTextInputField(
                hintText: "Email", 
                hintTextStyle: AppStyles.normalGreyTextStyle, 
                valueTextStyle: AppStyles.normalBlackTextStyle, 
                borderColor: Colors.grey, 
                borderRadius: 10, 
                btnHeight: 50, 
                keyboardType: TextInputType.emailAddress,
                controller: emailController),


              const SizedBox(height: 50,),
              DSolidButton(
                label: "CONTINUE", 
                btnHeight: 45, 
                bgColor: AppColors.primaryColor, 
                borderRadius: 10, 
                textStyle: AppStyles.normalWhiteTextStyle, 
                onClick: (){
                  final firstname = firstnameController.text;
                  final lastname = lastNameController.text;
                  final email = emailController.text;
                  final phone = phoneController.text;

                  if(
                    firstname.isEmpty || lastname.isEmpty || email.isEmpty || phone.isEmpty
                  ){
                    Fluttertoast.showToast(msg: "Fill in the fields to continue");
                  }else{
                    final user = User(
                      firstname: firstname, lastname: lastname, phone: phone);
                    value.user = user;
                    Navigator.pushNamed(context, RouteGenerator.homeScreen);
                  }
                  
                })

              ],
            ),
          ), ));
        },),
    );
  }
}