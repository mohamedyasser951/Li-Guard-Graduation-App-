import 'package:asps/screens/login/login_screen.dart';
import 'package:asps/screens/register/register_screen.dart';
import 'package:asps/screens/visitor/visitor_identity/visitor1.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatelessWidget {
  const LoginOrRegister({super.key});

  // TextStyle(fontWeight: FontWeight.w700, fontSize: 48.0)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                const Text(
                  "Let's you in",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 48.0),
                ),
               const SizedBox(
                  height: 10.0,
                ),
                const Image(
                  image:
                      AssetImage("assets/images/login-or-register-image.png"),
                  height: 300,
                  width: 300,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomizedButton(
                    buttonText: "Login",
                    buttonColor: primaryColor,
                    onPressed: () {
                      navigateTo(context, const Login_screen());
                    },
                    textColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 17.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomizedButton(
                    buttonText: "Register",
                    onPressed: () {
                      navigateTo(context,const RegisterSccreen());
                    },
                    textColor: Colors.black,
                    buttonColor: Colors.white,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 38.0, vertical: 14.0),
                    child: InkWell(
                        onTap: () {
                          navigateTo(context,const VisitorScreen1());
                        },
                        child: const Text("Are you visitor?",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0,
                                color: Color(0xFF4D9FFF)))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
