import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  String text;
  IconData prefixIcon;
  VoidCallback function;

  SettingsButton({
    required this.prefixIcon,
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                children: [
                  Icon(prefixIcon),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}