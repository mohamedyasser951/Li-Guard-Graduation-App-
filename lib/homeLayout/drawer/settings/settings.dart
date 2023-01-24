import 'package:asps/homeLayout/drawer/settings/setting/NotificationScreen.dart';
import 'package:asps/homeLayout/drawer/settings/setting/editProfileScreen.dart';
import 'package:asps/homeLayout/drawer/settings/setting/settingResetPassword.dart';
import 'package:asps/shared/component/component.dart';

import 'package:asps/shared/widgets/settingAppBar.dart';
import 'package:asps/shared/widgets/settingsButton.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar:  PreferredSize(
          preferredSize:const Size.fromHeight(56.0), child: SettingsAppBar(title: "Settings",)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            children: [
              const SizedBox(
                height: 22.0,
              ),
              SettingsButton(
                prefixIcon: Icons.person_outline,
                text: "Edit Profile",
                function: () {
                  navigateTo(context, EditProfileScreen());
                },
              ),
              SettingsButton(
                prefixIcon: Icons.password_sharp,
                text: "Reset Password",
                function: () {
                  navigateTo(context, SettingResetPassword());
                },
              ),
              SettingsButton(
                prefixIcon: Icons.notifications_outlined,
                text: "Notification",
                function: () {
                  navigateTo(context, NotificationScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


