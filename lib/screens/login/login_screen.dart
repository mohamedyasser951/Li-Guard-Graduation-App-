import 'package:asps/businessLogic/LoginCubit/bloc/login_bloc.dart';
import 'package:asps/businessLogic/LoginCubit/bloc/login_state.dart';
import 'package:asps/screens/homeLayout/homeLayout.dart';
import 'package:asps/screens/login/forget_password_by_email/password_reset.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/customizedTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.model.flage == 1) {}
            navigateAndKill(context, const HomeLayout());
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
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
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Log in to your \nAccount",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontSize: 34),
                      ),
                      Image.asset(
                        "assets/images/login_screen.png",
                        width: 350,
                        height: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomizedTextField(
                            controller: emailController,
                            validator: (val) {
                              if (val!.isEmpty) return "email must be entered";
                              return null;
                            },
                            label: "Email",
                            prefixIcon: Icons.person_sharp),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: CustomizedTextField(
                          controller: passwordController,
                          validator: ((val) {
                            if (val!.isEmpty) return "password must be entered";
                            return null;
                          }),
                          label: "password",
                          prefixIcon: Icons.lock,
                          suffixPressed: () {
                            cubit.changeVisibility();
                          },
                          suffixIcon: cubit.suffixIcon,
                          isPassword: cubit.ispassword,
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
                          Text("Remember me",
                              style: Theme.of(context).textTheme.bodyText1)
                        ],
                      ),
                      CustomizedButton(
                          buttonText: "Login",
                          buttonColor: bottomRemember,
                          textColor: Colors.white,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim());
                            }
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
            ),
          );
        },
      ),
    );
  }
}
