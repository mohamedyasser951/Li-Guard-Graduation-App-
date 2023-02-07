import 'package:asps/homeLayout/cubit/cubit.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';

class SettingTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  Icon? suffixIcon;
  VoidCallback? suffixPress;

   SettingTextField({
    this.suffixIcon,
    this.suffixPress,
    required this.controller,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 59,
        child: TextFormField(
          decoration: InputDecoration(
            suffixIcon: suffixIcon!= null? IconButton(icon:suffixIcon! ,onPressed: suffixPress,) :null,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                      width: 0.0, color: Theme.of(context).backgroundColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                      width: 0.0, color: Theme.of(context).backgroundColor)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                      width: 0.0, color: Theme.of(context).backgroundColor)),
              // label: Text(
              //   text,
              //   style: TextStyle(color: iconColor),
              // ),
              hintStyle: Theme.of(context).textTheme.bodyText1,
              hintText: text,
              fillColor:  LayoutCubit.get(context).isDark? const Color(0xff1F222A): Colors.white,
              filled: true),
        ),
      ),
    );
  }
}
