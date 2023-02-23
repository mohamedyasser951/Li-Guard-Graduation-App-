import 'package:asps/businessLogic/LayoutCubit/cubit.dart';
import 'package:asps/screens/login/login_screen.dart';
import 'package:asps/screens/register/register_screen.dart';
import 'package:asps/screens/visitor/visitor_identity/visitor1.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatelessWidget {
  const LoginOrRegister({super.key});


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
                Text(
                  "Let's you in",
                  style: Theme.of(context).textTheme.displaySmall,
                  // style: TextStyle(fontWeight: FontWeight.w700, fontSize: 48.0),
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
                  child: InkWell(
                    onTap: () => navigateTo(context, const RegisterSccreen()),
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 57,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF121D43) ),
                          color: LayoutCubit.get(context).isDark
                              ? const Color(0xff35383F)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          "Register",
                          style: Theme.of(context).textTheme.bodyText1,
                          // style: TextStyle(
                          //     color: Colors.black,
                          //     fontWeight: FontWeight.w600,
                          //     fontSize: 15.0),
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 38.0, vertical: 14.0),
                    child: InkWell(
                        onTap: () {
                          navigateTo(context, const VisitorScreen1());
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
