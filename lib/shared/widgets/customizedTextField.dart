import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';

class CustomizedTextField extends StatelessWidget {
  CustomizedTextField(
      {super.key,
      required this.controller,
      required this.validator,
      required this.hint,
      required this.prefixIcon,
      this.suffixIcon,
      this.isPassword, this.suffixPressed});
 final TextEditingController controller;
  final String? Function(String? val) validator;
 final String hint;
 final IconData prefixIcon;
  final IconData? suffixIcon;
  final Function? suffixPressed;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: controller,
      validator: validator,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: hint,
          
          hintStyle:const TextStyle(color: Color(0xFF616161),fontWeight: FontWeight.w500),
          prefixIcon: Icon(
            
            prefixIcon,
            size: 18,
            color: iconColor,
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
                onPressed: null,
                 icon: Icon(
                    suffixIcon,size: 18,color: iconColor,
                  ),
                 
                 
                  )
              : null,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide:  BorderSide(
                width: 0.0,
                color: backgroundColor,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide:  BorderSide(
                width: 0.0,
                color: backgroundColor,
              ))),
    );
  }
}
