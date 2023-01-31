
import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerItem extends StatelessWidget {
  String  iconPath;
  Widget? widget;
  String text;
  DrawerItem({super.key,this.widget ,required this.iconPath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.only(horizontal: 20.0, vertical: 14.0),
      padding:
          const EdgeInsets.only(right: 15.0, top: 14, bottom: 14.0, left: 25.0),
      child: Row(
        children: [
          SvgPicture.asset(iconPath,),
          const SizedBox(
            width: 19.0,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
               
          ),
          const Spacer(),
        
          const Icon(
            Icons.arrow_forward_ios,
           
            size: 18,
          ),
        ],
      ),
    );
  }
}
