import 'package:asps/businessLogic/LayoutCubit/cubit.dart';
import 'package:flutter/material.dart';

class CustomizedTextField extends StatelessWidget {
   CustomizedTextField(
      {super.key,
      required this.controller,
      required this.validator,
      required this.label,
      required this.prefixIcon,
      this.suffixIcon,
      this.isPassword = false,
      this.suffixPressed});
  final TextEditingController controller;
  final String? Function(String? val) validator;
  final String label;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final Function? suffixPressed;
   bool isPassword ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.titleLarge,
      controller: controller,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
          fillColor: LayoutCubit.get(context).isDark
              ? const Color(0xff1F222A)
              : Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: label,
          prefixIcon: Icon(
            prefixIcon,
            size: 18,
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: () {
                    suffixPressed!();
                  },
                  icon: Icon(
                    suffixIcon,
                    size: 20,
                    color: Theme.of(context).iconTheme.color,
                  ),
                )
              : null,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                width: 0.0,
                color: Theme.of(context).backgroundColor,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                width: 0.0,
                color: Theme.of(context).backgroundColor,
              ))),
    );
  }
}
