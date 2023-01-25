import 'package:asps/homeLayout/homeLayout.dart';
import 'package:asps/screens/onboarding/onboarding_Screen.dart';
import 'package:asps/screens/splash_screen/splash_screen.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/customizedTextField.dart';
import 'package:flutter/material.dart';
//54505151515

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
        primarySwatch: Colors.blue,
        
        appBarTheme:  AppBarTheme(
          iconTheme: IconThemeData(color: iconColor)
        ),
        backgroundColor: backgroundColor,
        iconTheme:const IconThemeData(
          color: Color(0xff121D43),
        ),
        textTheme:const TextTheme(
          headline6:TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 19.0,
            color: Color(0xff121D43)
          ),
          headline5:TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff121D43)
          ),
          headline3: TextStyle(
            color:  Color(0xff121D43)
          )
        ),
      ),
      
      home:  HomeLayout(),
    );
  }
}



