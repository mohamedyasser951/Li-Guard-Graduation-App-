import 'package:asps/shared/widgets/settingAppBar.dart';
import 'package:asps/shared/widgets/settingsTextField.dart';
import 'package:flutter/material.dart';

class SettingResetPassword extends StatelessWidget {
  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  SettingResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: SettingsAppBar(title: "Reset Password"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            children: [
              const SizedBox(
                height: 22.0,
              ),
              SettingTextField(
                  controller: oldPassController, text: "Old Password"),
              SettingTextField(
                  controller: newPassController, text: "New Password"),
              SettingTextField(
                  controller: confirmPassController, text: "Confirm Password")
            ],
          ),
        ),
      ),
    );
  }
}


