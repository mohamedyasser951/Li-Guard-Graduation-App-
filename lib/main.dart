// ignore_for_file: avoid_print

import 'package:asps/businessLogic/LayoutCubit/cubit.dart';
import 'package:asps/businessLogic/LayoutCubit/states.dart';
import 'package:asps/businessLogic/VisitorCubit/visitor_cubit.dart';
import 'package:asps/businessLogic/settingsCubit/cubit.dart';
import 'package:asps/screens/homeLayout/home_layout.dart';
import 'package:asps/screens/login_or_register/login_or_register.dart';
import 'package:asps/screens/onboarding/onboarding_screen.dart';
import 'package:asps/shared/component/bloc_observer.dart';
import 'package:asps/shared/network/local/shared_helper.dart';
import 'package:asps/shared/network/remote/end_points.dart';
import 'package:asps/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHelper.init();
  Bloc.observer = MyBlocObserver();
  Id = await SharedHelper.getData(key: "id");
  EMAIL = await SharedHelper.getData(key: "email");
  bool? isDarkFromShared = await SharedHelper.getData(key: "isDark");
  bool? isOnBoading = await SharedHelper.getData(key: "onboard");

  final Widget startWidget;

  if (isOnBoading != null) {
    if (Id != null && EMAIL != null) {
      startWidget = const HomeLayout();
    } else {
      startWidget = const LoginOrRegister();
    }
  } else {
    startWidget = const Onboarging();
  }

  print("email from shared $EMAIL");
  print("Id from shared $Id");

  print("onBoarding from shared $isOnBoading");

  runApp(MyApp(
    isDarkFromShared: isDarkFromShared,
    startWidget: startWidget,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDarkFromShared;
  final Widget startWidget;
  const MyApp({super.key, this.isDarkFromShared, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LayoutCubit()
              ..changeAppMode(isDarkFromShared: isDarkFromShared)),
        BlocProvider(create: (context) => SettingsCubit()),
        BlocProvider(create: (context) => VisitorCubit()),
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
                home: startWidget);
          }),
    );
  }
}
