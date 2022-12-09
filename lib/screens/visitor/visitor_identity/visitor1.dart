import 'package:asps/screens/visitor/visitor_identity/visitor2.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VisitorScreen1 extends StatelessWidget {
  const VisitorScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Let's verify your Identity",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text(
                      "we are required to verify your identity before \nyou can use the service. your information will \n be encrypted and stored securely",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const Image(
                      image: AssetImage("assets/images/visitor_image.png")),
                  const SizedBox(
                    height: 60.0,
                  ),
                  CustomizedButton(
                      buttonText: "Verify idetity",
                      buttonColor: primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        navigateTo(context, VisitorScreen2());
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
