import 'package:asps/screens/error/error_screen.dart';
import 'package:asps/screens/login/login_screen.dart';
import 'package:asps/screens/login_or_register/login_or_register.dart';
import 'package:asps/screens/onboarding/onboarding_Screen.dart';
import 'package:asps/screens/register/register_screen.dart';
import 'package:asps/screens/visitor/visitor_identity/visitor1.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/customizedTextField.dart';
import 'package:flutter/material.dart';
//adhwhduhwufhuwhfuhwuhfuw

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      // darkTheme: ThemeData(
      //   backgroundColor: darkbackgroundColor,
      // ),
      theme: ThemeData(
        primaryColor: const Color(0xFF4D9FFF),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black)
        ),
        backgroundColor: backgroundColor,
        textTheme:const TextTheme(
          headline3: TextStyle(
            color: Colors.black,
          )
        ),
      ),
      
      home:  Onboarging(),
    );
  }
}

// بجرب بيها الشكل بس HomePage

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomizedTextField(
              controller: controller,
              isPassword: false,
              validator: ((val) {
                if (val!.isEmpty) return "email must be entered";
                return null;
              }),
              label: "Email",
              prefixIcon: Icons.email,
            ),
            SizedBox(height: 20.0,),
            CustomizedTextField(
              controller: controller,
              validator: ((val) {
                if (val!.isEmpty) return "email must be entered";
                return null;
              }),
              label: "password",
              prefixIcon: Icons.lock,
              suffixIcon: Icons.visibility,
              isPassword: true,
            ),

              SizedBox(height: 20.0,),
            CustomizedButton(buttonText: "Login", buttonColor: Colors.cyan, textColor: Colors.white, onPressed: () {},)
          ],
        ),
      ),
    );
  }
}
