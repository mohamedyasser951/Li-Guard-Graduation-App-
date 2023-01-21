import 'package:asps/screens/login/forget_password_by_email/reset_passwordSucess.dart';
import 'package:asps/screens/login/login_screen.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/SquareTextField.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/customizedTextField.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  TextEditingController passwordController = TextEditingController();
  TextEditingController repassController = TextEditingController();
  ResetPassword({super.key});

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
                  "Create new password",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Your new password must be unique from those \npreviously used.",
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                CustomizedTextField(
                  controller: idController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter password";
                    }
                    return null;
                  },
                  label: "New Password",
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility,
                ),
                const SizedBox(
                  height: 14.0,
                ),
                CustomizedTextField(
                  controller: passwordController,
                  validator: (val) {},
                  label: "Confirm password",
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                CustomizedButton(
                  buttonText: "Reset password",
                  textColor: Colors.white,
                  onPressed: () {
                    navigateAndKill(context, const ResetPasswordSuccess());
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
