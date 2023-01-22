import 'package:asps/screens/login/forget_password_by_email/OTP_verification.dart';
import 'package:asps/screens/login/login_screen.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/customizedTextField.dart';
import 'package:flutter/material.dart';

class ForgetPasswordmobileReset extends StatelessWidget {
  ForgetPasswordmobileReset({super.key});
  TextEditingController idController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
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
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Forget password!",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Don’t worry, it happens to the best of us.",
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
                      image: AssetImage("assets/images/forget_pass_img.png"),
                      height: 220,
                      width: 270,
                    ),
                  ),
                  CustomizedTextField(
                      controller: idController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter id";
                        }
                        return null;
                      },
                      label: "Your ID",
                      prefixIcon: Icons.person),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomizedTextField(
                      controller: mobileController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter mobile number";
                        }
                        return null;
                      },
                      label: "Mobile number",
                      prefixIcon: Icons.phone_android),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 10.0),
                    child: InkWell(
                        onTap: () {},
                        child: const Text("Try another way",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0,
                                color: Color(0xFF4D9FFF)))),
                  ),
                  CustomizedButton(
                      buttonText: "Send code",
                      buttonColor: primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          navigateTo(context, OTPVerification());
                        }
                      }),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Remember password? ",
                          style: Theme.of(context).textTheme.subtitle2),
                      InkWell(
                          onTap: () {
                            navigateAndKill(context, const Login_screen());
                          },
                          child: const Text("Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0,
                                  color: Color(0xFF4D9FFF)))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
