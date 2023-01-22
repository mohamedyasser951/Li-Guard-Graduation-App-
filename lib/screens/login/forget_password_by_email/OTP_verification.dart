import 'package:asps/screens/login/forget_password_by_email/reset_password_screen.dart';

import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/SquareTextField.dart';
import 'package:asps/shared/widgets/customizedButton.dart';

import 'package:flutter/material.dart';

class OTPVerification extends StatelessWidget {
  OTPVerification({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "OTP Verification",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Enter the verification code we just sent on your \nemail address.",
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Center(
                  child: Image(
                    image: AssetImage("assets/images/OTP_img.png"),
                    height: 220,
                    width: 270,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      SquareTextField(),
                      SquareTextField(),
                      SquareTextField(),
                      SquareTextField(),
                    ],
                  ),
                ),
                const Center(child: Text("00:34")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Didn't get a code?"),
                    TextButton(
                        onPressed: () {},
                        child: Text("Resend",
                            style: TextStyle(color: primaryColor))),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomizedButton(
                  buttonText: "Verify",
                  textColor: Colors.white,
                  onPressed: () {
                    navigateTo(context, ResetPassword());
                  },
                  buttonColor: primaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
