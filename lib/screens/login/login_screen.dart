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
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        navigateTo(context, const LoginOrRegister());
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 40,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Log in to your Account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset("assets/images/login_screen.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomizedTextField(
                    controller: idController,
                    validator: (val) {},
                    label: "Your ID",
                    prefixIcon: Icons.person_sharp),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomizedTextField(
                  controller: passwordController,
                  validator: ((val) {
                    if (val!.isEmpty) return "email must be entered";
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
                  onPressed: () {}),
              // SizedBox(height: 10,),
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        navigateTo(context,const PasswordReset());
                      },
                      child: Text(
                        "Forgot the password?",
                        style: TextStyle(
                          fontSize: 15,
                          color: bottomRemember,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
