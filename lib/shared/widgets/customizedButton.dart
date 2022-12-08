import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';


class CustomizedButton extends StatelessWidget {
  String buttonText;
  Color? buttonColor = primaryColor;
  Color? textColor;
  VoidCallback onPressed;
  
  CustomizedButton(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      required this.textColor,
      required this.onPressed,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 57,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(


              color: buttonColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0),
            )),
      ),
    );
  }
}
