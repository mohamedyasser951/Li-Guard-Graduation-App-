import 'package:asps/homeLayout/cubit/cubit.dart';
import 'package:asps/homeLayout/cubit/states.dart';
import 'package:asps/homeLayout/homeLayout.dart';
import 'package:asps/screens/bottomNavScreens/inboxScreen.dart';
import 'package:asps/screens/login/login_screen.dart';
import 'package:asps/screens/login_or_register/login_or_register.dart';
import 'package:asps/screens/onboarding/onboarding_Screen.dart';
import 'package:asps/screens/register/register_screen.dart';
import 'package:asps/screens/setup.dart';
import 'package:asps/screens/splash_screen/splash_screen.dart';
import 'package:asps/screens/visitor/visitor_identity/visitor2.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/styles/Themes.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/customizedTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//54505151515

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
      ],
      child: BlocConsumer<LayoutCubit, LayoutStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Themes.lightTheme,
              darkTheme: Themes.darkTheme,
              themeMode: LayoutCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: LoginOrRegister(),
            );
          }),
    );
  }
}
