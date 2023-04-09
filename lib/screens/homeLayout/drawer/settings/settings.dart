import 'package:asps/screens/homeLayout/drawer/settings/setting/notification_screen.dart';
import 'package:asps/screens/homeLayout/drawer/settings/setting/edit_profile_screen.dart';
import 'package:asps/screens/homeLayout/drawer/settings/setting/setting_reset_password.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/widgets/setting_app_bar.dart';
import 'package:asps/shared/widgets/settings_button.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
                  navigateTo(context,const NotificationScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
