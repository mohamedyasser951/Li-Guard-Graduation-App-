import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      background: backgroundColor,
      brightness: Brightness.light,
      
    ),
    primaryColor: const Color(0xFF4D9FFF),
    fontFamily: "Urbanist",
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: iconColor),
        titleTextStyle: TextStyle(color: iconColor),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: backgroundColor,
        )),
    iconTheme: const IconThemeData(
      color: Color(0xff121D43),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(primaryColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(color: Color(0xff0057FF))),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: iconColor,
      suffixIconColor: iconColor,
      hintStyle: const TextStyle(
          color: Color(0xFF616161), fontWeight: FontWeight.w400),
      labelStyle: const TextStyle(
          color: Color(0xFF616161), fontWeight: FontWeight.w400),
    ),
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        color: Color(0xff121D43),
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
    colorScheme: ColorScheme.dark(
        primary: primaryColor,
        background: darkbackgroundColor,
        brightness: Brightness.dark),
    primaryColor: const Color(0xFF4D9FFF),
    fontFamily: "Urbanist",
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Color(0xff181A20),
          statusBarIconBrightness: Brightness.light,
        )),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      iconColor: Colors.white,
      prefixIconColor: Colors.white,
      hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
      labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xff0D0D0D),
        selectedIconTheme: IconThemeData(color: Color(0xff00FFFF))),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Colors.white),
      fillColor: MaterialStateProperty.all(const Color(0xff4D9FFF)),
    ),
    textTheme: const TextTheme(
        bodyText2: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
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
