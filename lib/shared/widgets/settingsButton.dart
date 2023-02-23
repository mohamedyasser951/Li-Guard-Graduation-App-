import 'package:asps/businessLogic/LayoutCubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsButton extends StatelessWidget {
 final String text;
 final String iconPath;
 final VoidCallback function;

  const SettingsButton({
    required this.iconPath,
    required this.text,
    required this.function,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
      child: InkWell(
        onTap: function,
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 57,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color:  LayoutCubit.get(context).isDark?  const Color(0xff1F222A):Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                children: [
                 SvgPicture.asset(iconPath,color: LayoutCubit.get(context).isDark? const Color(0xff95969D):const Color(0xff121D43)),
                const SizedBox(width: 20.0,),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodyLarge
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
