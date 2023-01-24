
import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  IconData iconData;
  Widget? widget;
  String text;
  DrawerItem({super.key,this.widget ,required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.only(horizontal: 20.0, vertical: 14.0),
      padding:
          const EdgeInsets.only(right: 15.0, top: 14, bottom: 14.0, left: 25.0),
      child: Row(
        children: [
          Icon(
            iconData,
            color: iconColor,
            size: 25.0,
          ),
          const SizedBox(
            width: 19.0,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: iconColor),
          ),
          const Spacer(),
        
          Icon(
            Icons.arrow_forward_ios,
            color: iconColor,
            size: 18,
          ),
        ],
      ),
    );
  }
}
