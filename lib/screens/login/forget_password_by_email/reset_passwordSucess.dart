import 'package:asps/screens/login/forget_password_by_email/reset_password_screen.dart';
import 'package:asps/screens/login/login_screen.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:flutter/material.dart';

class ResetPasswordSuccess extends StatelessWidget {
  const ResetPasswordSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).backgroundColor,
      //   elevation: 0.0,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //     icon: const Icon(
      //       Icons.arrow_back,
      //       size: 30,
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/images/pass_reset_success.png"),
                    height: 220,
                    width: 270,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Password Changed!",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Your password has been changed \nsuccessfully.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 36.0,
                  ),
                  CustomizedButton(
                    buttonText: "Back to login",
                    textColor: Colors.white,
                    onPressed: () {
                      navigateAndKill(context,const Login_screen());
                    },
                    buttonColor: primaryColor,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
