import 'dart:io';
import 'package:asps/businessLogic/LayoutCubit/cubit.dart';
import 'package:asps/businessLogic/LayoutCubit/states.dart';
import 'package:asps/businessLogic/RegisterCubit/register_cubit.dart';
import 'package:asps/businessLogic/VisitorCubit/visitor_cubit.dart';
import 'package:asps/screens/bottomNavScreens/post_screen.dart';
import 'package:asps/screens/homeLayout/drawer/drawer.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/network/remote/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  File? VisitorImageFile;

  @override
  void initState() {
    super.initState();
    // if (Id == null) {
    //   VisitorCubit.get(context).getVisitorimageProfile();
    // }
    //  else {
    //   RegisterCubit.get(context).getUserimageProfile();
    // }
  }

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Theme.of(context).appBarTheme.systemOverlayStyle!.statusBarColor,
      statusBarBrightness:
          Theme.of(context).appBarTheme.systemOverlayStyle!.statusBarBrightness,
      statusBarIconBrightness: Theme.of(context)
          .appBarTheme
          .systemOverlayStyle!
          .statusBarIconBrightness,
    ));
    return SafeArea(
      child: BlocBuilder<LayoutCubit, LayoutStates>(builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          key: scaffoldState,
          drawer: Id != null ? const MyDrawer() : null,
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(110.0),
              child: CutomeHomeAppBar(scaffoldState: scaffoldState)),
          body: cubit.tabIndex == 0
              ? Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/map.png")),
                  ),
                )
              : const PostScreen(),
        );
      }),
    );
  }
}

class CutomeHomeAppBar extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldState;
  const CutomeHomeAppBar({
    required this.scaffoldState,
    Key? key,
  }) : super(key: key);

  @override
  State<CutomeHomeAppBar> createState() => _CutomeHomeAppBarState();
}

class _CutomeHomeAppBarState extends State<CutomeHomeAppBar> {
  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return SafeArea(
      child: Container(
          decoration: BoxDecoration(
            color: LayoutCubit.get(context).isDark
                ? const Color(0xff0D0D0D)
                : Colors.white,
          ),
          height: 105,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (Id != null) {
                            widget.scaffoldState.currentState!.openDrawer();
                          }
                        },
                        // color:  Colors.white ,
                        icon: SvgPicture.asset(
                            color: LayoutCubit.get(context).isDark
                                ? Colors.white
                                : iconColor,
                            "assets/icons/ic_menu.svg")),
                    Text(
                      "Li Guard",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 25.0),
                    ),
                    CircleAvatar(
                      radius: 25.0,
                      backgroundColor: primaryColor,
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(File(imgpath!))
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        cubit.changeTabIndex(index: 0);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 2.4,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: cubit.tabIndex == 0
                                ? primaryColor
                                : Colors.black12),
                        child: Text(
                          "Home",
                          style: TextStyle(
                              color: cubit.tabIndex == 0
                                  ? Colors.white
                                  : primaryColor),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        cubit.changeTabIndex(index: 1);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.4,
                        alignment: Alignment.center,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: cubit.tabIndex == 1
                                ? primaryColor
                                : Colors.black12),
                        child: Text(
                          "Posts",
                          style: TextStyle(
                              color: cubit.tabIndex == 1
                                  ? Colors.white
                                  : primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
