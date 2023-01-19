import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:flutter/material.dart';

class Error_screen extends StatefulWidget {
  const Error_screen({Key? key}) : super(key: key);

  @override
  State<Error_screen> createState() => _ErrorState();
}

class _ErrorState extends State<Error_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height:200,
              ),
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
              Container(
                height: 46,
                width: 258,
                  child
                  : const Text(
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
    );
  }
}
