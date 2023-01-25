import 'package:asps/homeLayout/drawer/drawer.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      drawer: const MyDrawer(),
      body: Container(
        color: Colors.white30,
        child: Column(
          children: [
            CutomeHomeAppBar(scaffoldState: scaffoldState),
            Expanded(
              child: Container(
                color: Colors.white,
                child: const Center(child: Text("Home Screen")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CutomeHomeAppBar extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldState;
  CutomeHomeAppBar({
    required this.scaffoldState,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(162.0),
        child: SafeArea(
          child: Container(
              decoration: const BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)),
              ),
              height: 100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          scaffoldState.currentState!.openDrawer();
                        },
                        icon: SvgPicture.asset("assets/icons/ic_menu.svg")),
                    CircleAvatar(
                      radius: 25.0,
                      backgroundColor: primaryColor,
                    ),
                  ],
                ),
              )),
        ));
  }
}
