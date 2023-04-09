import 'package:asps/businessLogic/LayoutCubit/cubit.dart';
import 'package:asps/businessLogic/LayoutCubit/states.dart';
import 'package:asps/businessLogic/settingsCubit/cubit.dart';
import 'package:asps/screens/bottomNavScreens/home_screen.dart';
import 'package:asps/screens/bottomNavScreens/post_screen.dart';
import 'package:asps/screens/bottomNavScreens/task_screen.dart';
import 'package:asps/screens/bottomNavScreens/inbox_screen.dart';
import 'package:asps/screens/bottomNavScreens/metting_screen.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/network/remote/end_points.dart';
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
    const PostScreen(),
    if (Id != null) const MettingScreen(),
    if (Id != null) const TasksScreen(),
    if (Id != null) const InboxScreen(),
  ];

  @override
  void initState() {
    if (Id != null) {
      BlocProvider.of<SettingsCubit>(context).getUserData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        return Scaffold(
          body: screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0.0,
            
              selectedItemColor: primaryColor,
              currentIndex: cubit.currentindex,
              onTap: (value) => cubit.changBottomNav(index: value),
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/ic_home.svg",
                      color: cubit.currentindex == 0
                          ? Theme.of(context)
                              .bottomNavigationBarTheme
                              .selectedIconTheme!
                              .color
                          : null,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/ic_home.svg",
                      color: cubit.currentindex == 1
                          ? Theme.of(context)
                              .bottomNavigationBarTheme
                              .selectedIconTheme!
                              .color
                          : null,
                    ),
                    label: ""),
                if (Id != null)
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/icons/ic_metting.svg",
                        color: cubit.currentindex == 2
                            ? Theme.of(context)
                                .bottomNavigationBarTheme
                                .selectedIconTheme!
                                .color
                            : null,
                      ),
                      label: ""),
                if (Id != null)
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/icons/ic_task.svg",
                        color: cubit.currentindex == 3
                            ? Theme.of(context)
                                .bottomNavigationBarTheme
                                .selectedIconTheme!
                                .color
                            : null,
                      ),
                      label: ""),
                if (Id != null)
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/icons/ic_inbox.svg",
                        color: cubit.currentindex == 4
                            ? Theme.of(context)
                                .bottomNavigationBarTheme
                                .selectedIconTheme!
                                .color
                            : null,
                      ),
                      label: ""),
              ]),
        );
      },
    );
  }
}
