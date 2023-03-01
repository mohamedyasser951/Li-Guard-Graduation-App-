import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorState();
}

class _ErrorState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               
                Image.asset("assets/images/error404.png"),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  "Ops! Something went wrong",
                  style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26)
                  ,),
                const SizedBox(
                  height: 8,
                ),
               const SizedBox(
                  height: 46,
                  width: 258,
                    child
                    :  Text(
                        "Please check your internet connection and try again",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15))
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomizedButton(
                    buttonText: "Try again",
                    buttonColor: primaryColor,
                    textColor: Colors.white,
                    onPressed: (){}
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
