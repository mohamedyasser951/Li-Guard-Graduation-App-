import 'package:asps/homeLayout/drawer/settings/settings.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/drawerItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              DrawerItem(iconData: Icons.bookmark, text: "Select company"),
              GestureDetector(
                  onTap: () {
                    navigateTo(context, SettingScreen());
                  },
                  child: DrawerItem(
                      iconData: Icons.settings_outlined, text: "Settings")),
              Padding(
                padding:
                    const EdgeInsets.only(top: 14, bottom: 14.0, left: 25.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.brightness_3_outlined,
                      color: iconColor,
                      size: 25.0,
                    ),
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
              DrawerItem(iconData: Icons.privacy_tip_outlined, text: "Privacy"),
              DrawerItem(
                  iconData: Icons.person_outline, text: "Help & Support"),
              DrawerItem(iconData: Icons.question_mark_rounded, text: "About"),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  //LogOutDialog(context);
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

// Future LogOutDialog(BuildContext context) => showDialog(
//       context: context,
//       builder: (context) {
//         return Container(
//           width: 200,
//           height: 200,
//           decoration:  BoxDecoration(
//             color: Theme.of(context).backgroundColor,
//             shape: BoxShape.rectangle,
//             // color: Color.fromARGB(0, 205, 40, 40),
//             borderRadius:const BorderRadius.all(Radius.circular(32.0)),
//           ),
//           child: Dialog(
//             alignment: Alignment.center,
//             elevation: 0.0,
//             clipBehavior: Clip.antiAlias,
//             child: Container(
//               height: 380,
//               width: 400,
//               decoration: BoxDecoration(
//                   color: Colors.red,
//                   borderRadius: BorderRadius.circular(40.0)),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Image(
//                     image: AssetImage("assets/images/logout_img.png"),
//                   ),
//                   const SizedBox(
//                     height: 10.0,
//                   ),
//                   Text(
//                     "Are you sure you want to \n logout?",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: primaryColor,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 25.0
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20.0,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
