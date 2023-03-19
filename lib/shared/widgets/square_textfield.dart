import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SquareTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  bool isLast;
  SquareTextField({super.key, required this.controller, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 58,
      height: 55,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return " ";
          }
          return null;
        },
        controller: controller,
        style: Theme.of(context).textTheme.bodyLarge,
        onChanged: (value) {
          if (value.length == 1 && !isLast) {
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
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            )),
      ),
    );
  }
}
