import 'package:asps/screens/bottomNavScreens/HomeScreen.dart';
import 'package:asps/screens/bottomNavScreens/TaskScreen.dart';
import 'package:asps/screens/bottomNavScreens/inboxScreen.dart';
import 'package:asps/screens/bottomNavScreens/mettingScreen.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.white,
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
                  color: currentIndex == 0 ? const Color(0xff0057FF) : null,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/ic_metting.svg",
                  color: currentIndex == 1 ? const Color(0xff0057FF) : null,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/ic_task.svg",
                  color: currentIndex == 2 ? const Color(0xff0057FF) : null,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/ic_inbox.svg",
                  color: currentIndex == 3 ? const Color(0xff0057FF) : null,
                ),
                label: ""),
          ]),
    );
  }
}
