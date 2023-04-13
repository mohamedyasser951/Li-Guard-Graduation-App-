import 'dart:io';

import 'package:asps/businessLogic/LayoutCubit/cubit.dart';
import 'package:asps/businessLogic/RegisterCubit/register_cubit.dart';
import 'package:asps/businessLogic/settingsCubit/cubit.dart';
import 'package:asps/businessLogic/settingsCubit/states.dart';
import 'package:asps/screens/homeLayout/drawer/settings/settings.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/network/remote/end_points.dart';
import 'package:asps/shared/widgets/drawer_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);

    return Builder(builder: (context) {
      return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        width: 300,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                      CircleAvatar(
                        radius: 44.0,
                        backgroundColor: primaryColor,
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(File(imgpath!)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 14.0,
                      ),
                      BlocBuilder<SettingsCubit, SettingsStates>(
                        builder: (context, state) {
                          return Text(
                            SettingsCubit.get(context)
                                .userDataModel
                                .data!
                                .userName!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        "View Profile",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
                const DrawerItem(
                    iconPath: "assets/icons/ic_selectcompany.svg",
                    text: "Select company"),
                InkWell(
                    onTap: () {
                      navigateTo(context, const SettingScreen());
                    },
                    child: const DrawerItem(
                        iconPath: "assets/icons/ic_setting.svg",
                        text: "Settings")),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 14, bottom: 14.0, left: 25.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/ic_darkthem.svg",
                        color: LayoutCubit.get(context).isDark
                            ? const Color(0xff95969D)
                            : const Color(0xff121D43),
                      ),
                      const SizedBox(
                        width: 19.0,
                      ),
                      Text("Dark Theme",
                          style: Theme.of(context).textTheme.bodyLarge),
                      const Spacer(),
                      Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                              activeColor: primaryColor,
                              value: cubit.isDark,
                              onChanged: (val) {
                                cubit.changeAppMode();
                              })),
                    ],
                  ),
                ),
                const DrawerItem(
                    iconPath: "assets/icons/ic_privacy.svg", text: "Privacy"),
                const DrawerItem(
                    iconPath: "assets/icons/ic_support.svg",
                    text: "Help & Support"),
                const DrawerItem(
                    iconPath: "assets/icons/ic_about.svg", text: "About"),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {
                    logOutDialog(context);
                  },
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 50.0,
                      ),
                      Icon(
                        Icons.logout,
                        color: Color(0xffE30000),
                      ),
                      SizedBox(
                        width: 14.0,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                            color: Color(0xffE30000),
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

Future logOutDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 25.0),
          alignment: Alignment.center,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(40.0)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    height: 210,
                    width: 350,
                    image: AssetImage("assets/images/logout_img.png"),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    "Are you sure you want to \nlogout?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0),
                  ),
                  const SizedBox(
                    height: 41.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 130,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF121D43)),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Center(
                              child: Text(
                            'Cancel',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.black,
                                    ),
                          )),
                        ),
                      ),
                      // const SizedBox(width: 8.0,),
                      InkWell(
                        onTap: () {
                          logOut(context);
                        },
                        child: Container(
                          width: 130,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Color(0xFF6F9EFF), Color(0xFF246BFD)]),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Center(
                              child: Text(
                            'Logout',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
