import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';


class SquareTextField extends StatelessWidget {
  const SquareTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      child: TextFormField(
        showCursor: false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            enabledBorder:const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            )),
      ),
    );
  }
}
