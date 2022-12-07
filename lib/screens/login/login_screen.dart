import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/customizedTextField.dart';
import 'package:flutter/material.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  State<Login_screen> createState() => _Login_screenState();
}
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isRememberMe =false;

class _Login_screenState extends State<Login_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
       body: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(15),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               SizedBox(height: 30,),
               Row(
                 children: [
                   IconButton(onPressed: () {},
                       icon: Icon(Icons.arrow_back,size: 40,)),
                 ],
               ),
              SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: Text("Log in to your Account" ,

                   style:TextStyle(fontWeight: FontWeight.bold,fontSize:40 ),),
               ),
               Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: Image.asset("assets/images/login_screen.png"),
               ),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: CustomizedTextField(
                     controller:idController ,
                     validator: (val) {},
                     hint: "Your ID",
                     prefixIcon: Icons.person_sharp),

               ),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child:  CustomizedTextField(
                   controller: passwordController,
                   validator: ((val) {
                     if (val!.isEmpty) return "email must be entered";
                     return null;
                   }),
                   hint: "password",
                   prefixIcon: Icons.lock,
                   suffixIcon: Icons.visibility,
                   isPassword: true,
                 ),
               ),
               Row(
                 children: [
                   Theme(data: ThemeData(unselectedWidgetColor: bottomRemember,),
                       child: Container(
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
                         child: Checkbox(
                           splashRadius: 25,
                           value: isRememberMe,
                           onChanged: (value) {
                             setState(() {
                               isRememberMe = value!;
                             });
                           },
                         checkColor: backgroundColor,
                         activeColor: bottomRemember,
                         ),
                       )),
                   Text("Remember me",style: TextStyle(color: Colors.black),)
                 ],
               ),
               CustomizedButton(buttonText: "Login", buttonColor: bottomRemember, textColor: Colors.white, onPressed: (){}),
               // SizedBox(height: 10,),
               Row(
                 children: [
                   Spacer(),
                   TextButton(onPressed: () {}, child: Text("Forgot the password?",style: TextStyle(fontSize: 15,color: bottomRemember,),)),
                 ],
               ),

             ],
           ),
         ),
       ),
    );
  }
}
