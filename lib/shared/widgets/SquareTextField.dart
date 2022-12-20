import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SquareTextField extends StatelessWidget {
  const SquareTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 58,
      height: 55,
      child: TextFormField(
        onChanged: (value) {
          if(value.length == 1){
            FocusScope.of(context).nextFocus();
          }
        },
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
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
