import 'package:asps/homeLayout/drawer/settings/settings.dart';
import 'package:asps/screens/login/login_screen.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/drawerItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).backgroundColor,
      width: 300,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                //  color: Colors.amber,
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
                      radius: 44,
                      backgroundColor: primaryColor,
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    Text(
                      "Mohamed Yasser",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "View Profile",
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
              DrawerItem( iconPath: "assets/icons/ic_selectcompany.svg", text: "Select company"),
              GestureDetector(
                  onTap: () {
                    navigateTo(context, SettingScreen());
                  },
                  child: DrawerItem(
                      iconPath: "assets/icons/ic_setting.svg", text: "Settings")),
              Padding(
                padding:
                    const EdgeInsets.only(top: 14, bottom: 14.0, left: 25.0),
                child: Row(
                  children: [
                   SvgPicture.asset("assets/icons/ic_darkthem.svg"),
                    const SizedBox(
                      width: 19.0,
                    ),
                    Text(
                      "Dark Theme",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: iconColor),
                    ),
                    const Spacer(),
                    Transform.scale(
                        scale: 0.8,
                        child:
                            CupertinoSwitch(value: false, onChanged: (val) {})),
                  ],
                ),
              ),
              DrawerItem(iconPath:"assets/icons/ic_privacy.svg" , text: "Privacy"),
              DrawerItem(
                  iconPath: "assets/icons/ic_support.svg", text: "Help & Support"),
              DrawerItem(iconPath: "assets/icons/ic_about.svg", text: "About"),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  LogOutDialog(context);
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
                      style: TextStyle(color: Color(0xffE30000)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future LogOutDialog(BuildContext context) => showDialog(
  
      context: context,
      builder: (context) {
        
        return Dialog(
          insetPadding:const EdgeInsets.symmetric(horizontal: 25.0),
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
                color: Theme.of(context).backgroundColor
                
                , borderRadius: BorderRadius.circular(40.0)),
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
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black,
                            ),
                          )),
                        ),
                      ),
                      // const SizedBox(width: 8.0,),
                      InkWell(
                        onTap: () {
                          navigateAndKill(context, Login_screen());
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
                            style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
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
