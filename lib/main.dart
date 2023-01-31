import 'package:asps/homeLayout/homeLayout.dart';
import 'package:asps/screens/onboarding/onboarding_Screen.dart';
import 'package:asps/screens/register/register_screen.dart';
import 'package:asps/screens/splash_screen/splash_screen.dart';
import 'package:asps/screens/visitor/visitor_identity/visitor2.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/styles/Themes.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/customizedTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      theme: Themes.lightTheme,
darkTheme:Themes.darkTheme, 
      themeMode: ThemeMode.dark,
      home:HomeLayout(),
    );
  }
}



