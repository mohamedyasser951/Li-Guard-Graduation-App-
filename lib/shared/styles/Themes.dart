import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF4D9FFF),
    fontFamily: "Urbanist",
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: iconColor),
        systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
          // statusBarBrightness: Brightness.dark,
          statusBarColor: backgroundColor,
        )),
    backgroundColor: backgroundColor,
    iconTheme: const IconThemeData(
      color: Color(0xff121D43),
    ),
    textTheme: const TextTheme(
        bodyText2: TextStyle(
          color:Color(0xff121D43) ,
          fontSize: 13.0,
        ),
      bodyText1: TextStyle(
          color: Color(0xff121D43),
          fontSize: 16.0,
          fontWeight: FontWeight.bold),
      caption: TextStyle(
        color: Color(0xff121D43),
      ),
      headline4: TextStyle(
          color: Color(0xff121D43),
          fontWeight: FontWeight.w600,
          fontSize: 38.0),
      headline3: TextStyle(color: Color(0xff121D43)),
      headline6: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 19.0,
          color: Color(0xff121D43)),
      headline5:
          TextStyle(fontWeight: FontWeight.bold, color: Color(0xff121D43)),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    backgroundColor: darkbackgroundColor,
    primaryColor: const Color(0xFF4D9FFF),
    fontFamily: "Urbanist",
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(
        iconTheme:const IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: darkbackgroundColor,
        )),
    // inputDecorationTheme: InputDecorationTheme(
     
     
    // ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff0D0D0D), 
      selectedIconTheme: IconThemeData(color: Color(0xff00FFFF))
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Colors.white),
      fillColor: MaterialStateProperty.all(const Color(0xff4D9FFF)),
    ),
    textTheme: const TextTheme(
        bodyText2: TextStyle(
          color: Colors.white,
          fontSize: 13.0,
        ),
        bodyText1: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
        ),
        caption: TextStyle(
          color: Colors.white,
        ),
        headline4: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30.0),
        headline3: TextStyle(color: Colors.white),
        headline6: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 19.0, color: Colors.white),
        headline5: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w900, color: Colors.white)),
  );
}
