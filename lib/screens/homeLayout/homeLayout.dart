import 'package:asps/businessLogic/settingsCubit/cubit.dart';
import 'package:asps/screens/bottomNavScreens/home_screen.dart';
import 'package:asps/screens/bottomNavScreens/task_screen.dart';
import 'package:asps/screens/bottomNavScreens/inbox_screen.dart';
import 'package:asps/screens/bottomNavScreens/metting_screen.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  List<Widget> screens = [
    HomeScreen(),
    const MettingScreen(),
    const TasksScreen(),
    const InboxScreen(),
  ];

  int currentIndex = 0;

  @override
  void initState() {
    BlocProvider.of<SettingsCubit>(context).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
          selectedItemColor: primaryColor,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/ic_home.svg",
                  color: currentIndex == 0
                      ? Theme.of(context)
                          .bottomNavigationBarTheme
                          .selectedIconTheme!
                          .color
                      : null,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/ic_metting.svg",
                  color: currentIndex == 1
                      ? Theme.of(context)
                          .bottomNavigationBarTheme
                          .selectedIconTheme!
                          .color
                      : null,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/ic_task.svg",
                  color: currentIndex == 2
                      ? Theme.of(context)
                          .bottomNavigationBarTheme
                          .selectedIconTheme!
                          .color
                      : null,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/ic_inbox.svg",
                  color: currentIndex == 3
                      ? Theme.of(context)
                          .bottomNavigationBarTheme
                          .selectedIconTheme!
                          .color
                      : null,
                ),
                label: ""),
          ]),
    );
  }
}
