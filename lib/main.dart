import 'package:asps/businessLogic/LayoutCubit/cubit.dart';
import 'package:asps/businessLogic/LayoutCubit/states.dart';
import 'package:asps/businessLogic/settingsCubit/cubit.dart';
import 'package:asps/screens/homeLayout/homeLayout.dart';
import 'package:asps/screens/login/login_screen.dart';
import 'package:asps/screens/register/register_screen.dart';
import 'package:asps/screens/visitor/visitor_setup/faceCaptureScreen.dart';
import 'package:asps/shared/component/bloc_observer.dart';
import 'package:asps/shared/network/local/shared_helper.dart';
import 'package:asps/shared/network/remote/end_points.dart';
import 'package:asps/shared/styles/themes.dart';
import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//54505151515

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHelper.init();
  await FaceCamera.initialize();
  Bloc.observer = MyBlocObserver();

  Id = await SharedHelper.getData(key: "id");
  Email = await SharedHelper.getData(key: "email");

  print("email from shared $Email");

  bool? isDarkFromShared = await SharedHelper.getData(key: "isDark");

  runApp(MyApp(
    isDarkFromShared: isDarkFromShared,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDarkFromShared;
  const MyApp({super.key, this.isDarkFromShared});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LayoutCubit()
              ..changeAppMode(isDarkFromShared: isDarkFromShared)),
        BlocProvider(create: (context) => SettingsCubit()),
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
                home: Login_screen());
          }),
    );
  }
}
