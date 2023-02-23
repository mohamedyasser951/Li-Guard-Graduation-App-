import 'package:asps/businessLogic/LayoutCubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerItem extends StatelessWidget {
  final String iconPath;
  final Widget? widget;
  final String text;
  const DrawerItem(
      {super.key, this.widget, required this.iconPath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 15.0, top: 14, bottom: 14.0, left: 25.0),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            color: LayoutCubit.get(context).isDark
                ? const Color(0xff95969D)
                : const Color(0xff121D43),
          ),
          const SizedBox(
            width: 19.0,
          ),
          Text(text, style: Theme.of(context).textTheme.bodyLarge),
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
