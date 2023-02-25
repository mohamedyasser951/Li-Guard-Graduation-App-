import 'package:asps/screens/homeLayout/drawer/settings/setting/NotificationScreen.dart';
import 'package:asps/screens/homeLayout/drawer/settings/setting/editProfileScreen.dart';
import 'package:asps/screens/homeLayout/drawer/settings/setting/settingResetPassword.dart';
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
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: SettingsAppBar(
            title: "Settings",
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            children: [
              const SizedBox(
                height: 22.0,
              ),
              SettingsButton(
                iconPath: "assets/icons/ic_person.svg",
                text: "Edit Profile",
                function: () {
                  navigateTo(context, EditProfileScreen());
                },
              ),
              SettingsButton(
                iconPath: "assets/icons/ic_resetpass.svg",
                text: "Reset Password",
                function: () {
                  navigateTo(context, SettingResetPassword());
                },
              ),
              SettingsButton(
                iconPath: "assets/icons/ic_notification.svg",
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