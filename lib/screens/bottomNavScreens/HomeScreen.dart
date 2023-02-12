import 'package:asps/businessLogic/LayoutCubit/cubit.dart';
import 'package:asps/homeLayout/drawer/drawer.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        key: scaffoldState,
        drawer: const MyDrawer(),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/map.png")),
              ),
              // child: const Center(child: Text("Home Screen")),
            ),
            CutomeHomeAppBar(scaffoldState: scaffoldState),
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
              decoration:  BoxDecoration(
                color: LayoutCubit.get(context).isDark?  const Color(0xff0D0D0D):Colors.white,
                borderRadius:const BorderRadius.only(
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
                       // color:  Colors.white ,
                        icon: SvgPicture.asset(
                          color:  LayoutCubit.get(context).isDark?  Colors.white :iconColor,
                          
                          "assets/icons/ic_menu.svg")),
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
