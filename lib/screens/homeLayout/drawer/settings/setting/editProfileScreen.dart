import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/settingAppBar.dart';
import 'package:asps/shared/widgets/settingsTextField.dart';
import 'package:flutter/material.dart';


class EditProfileScreen extends StatelessWidget {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController secondnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController numberController = TextEditingController();
   EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar:const PreferredSize(
            preferredSize:  Size.fromHeight(56.0),
            child: SettingsAppBar(
              title: "Edit Profile",
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 22.0,
                ),
                SettingTextField(controller: firstnameController, text: "mohamed",validator: (val) {
                  
                },),
                SettingTextField(controller: secondnameController, text: "yasser",validator: (val) {
                  
                },),
                SettingTextField(
                    controller: emailController, text: "mohamed12@gmaail.com",validator: (val) {
                      
                    },),
                SettingTextField(controller: countryController, text: "Egypt",suffixIcon: const Icon(Icons.keyboard_arrow_down),suffixPress: null,validator: (val){},),
                SettingTextField(controller: numberController, text: "+201207868561",validator: (val){},),
                const SizedBox(height: 100,),
                CustomizedButton(buttonText: "Update", buttonColor: primaryColor, textColor: Colors.white, onPressed: (){},),
              ],
            ),
          ),
        ));
  }
}
