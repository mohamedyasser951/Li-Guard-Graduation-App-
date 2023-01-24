import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';

class SettingsAppBar extends StatelessWidget {
  String title;
   SettingsAppBar({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          size: 30.0,
        ),
        onPressed: () {
         
          
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      title: Text(title, style: TextStyle(color: iconColor)),
    );
  }
}
