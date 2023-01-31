import 'package:asps/homeLayout/homeLayout.dart';
import 'package:asps/screens/login/forget_password_by_email/password_reset.dart';
import 'package:asps/screens/login_or_register/login_or_register.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/customizedTextField.dart';
import 'package:flutter/material.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  State<Login_screen> createState() => _Login_screenState();
}

TextEditingController idController = TextEditingController();
TextEditingController passwordController = TextEditingController();

bool isRememberMe = false;

class _Login_screenState extends State<Login_screen> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Log in to your Account",
                style: Theme.of(context).textTheme.headline4,
              ),
              Image.asset(
                "assets/images/login_screen.png",
                width: 350,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomizedTextField(
                    controller: idController,
                    validator: (val) {},
                    label: "Email",
                    prefixIcon: Icons.person_sharp),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10.0),
                child: CustomizedTextField(
                  controller: passwordController,
                  validator: ((val) {
                    if (val!.isEmpty) return "password must be entered";
                    return null;
                  }),
                  label: "password",
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility,
                  isPassword: true,
                ),
              ),
              Row(
                children: [
                  Theme(
                      data: ThemeData(
                        unselectedWidgetColor: bottomRemember,
                      ),
                      child: Checkbox(
                        value: isRememberMe,
                        onChanged: (value) {
                          setState(() {
                            isRememberMe = value!;
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        checkColor: backgroundColor,
                        activeColor: bottomRemember,
                      )),
                  const Text(
                    "Remember me",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              CustomizedButton(
                  buttonText: "Login",
                  buttonColor: bottomRemember,
                  textColor: Colors.white,
                  onPressed: () {
                    navigateTo(context, const HomeLayout());
                  }),

              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      navigateTo(context, const PasswordReset());
                    },
                    child: Text(
                      "Forgot the password?",
                      style: TextStyle(
                        fontSize: 15,
                        color: bottomRemember,
                      ),
                    )),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
