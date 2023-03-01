import 'package:asps/businessLogic/LayoutCubit/cubit.dart';
import 'package:asps/businessLogic/LayoutCubit/states.dart';
import 'package:asps/screens/homeLayout/homeLayout.dart';
import 'package:asps/screens/register/register_screen.dart';
import 'package:asps/shared/component/bloc_observer.dart';
import 'package:asps/shared/network/local/shared_helper.dart';
import 'package:asps/shared/styles/Themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//54505151515 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHelper.init();
  // await FaceCamera.initialize();
  Bloc.observer = MyBlocObserver();


  // Id = await SharedHelper.getData(key:"id");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()..getTasks()),
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
                home: const HomeLayout());
          }),
    );
  }
}

