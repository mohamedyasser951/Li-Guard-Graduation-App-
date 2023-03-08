import 'package:asps/businessLogic/RegisterCubit/register_cubit.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customized_button.dart';
import 'package:asps/shared/widgets/customized_textField.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final PageController pageController;

  Page2({
    Key? key,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.pageController,
  }) : super(key: key);

  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubit.get(context);
    return Container(
        color: Theme.of(context).colorScheme.background,
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: CustomizedTextField(
                  controller: passwordController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "* password required";
                    }
                    return null;
                  },
                  label: "Password",
                  prefixIcon: Icons.lock,
                  suffixIcon: cubit.suffixIcon1,
                  isPassword: cubit.isPassword,
                  suffixPressed: () {
                    cubit.changeVisibility();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomizedTextField(
                  controller: confirmPasswordController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "* Confirm Password required";
                    } else if (val != passwordController.text) {
                      return "password not matched";
                    }
                    return null;
                  },
                  label: "Confirm Password",
                  prefixIcon: Icons.lock,
                  isPassword: cubit.isConfirmPassword,
                  suffixIcon: cubit.suffixIcon2,
                  
                  suffixPressed: () {
                    cubit.changeVisibility(ispassword: false);
                  },
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomizedButton(
                  buttonText: "Countinue",
                  textColor: Colors.white,
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      pageController.nextPage(
                          curve: Curves.easeInCubic,
                          duration: const Duration(microseconds: 500));
                    }
                  },
                  buttonColor: primaryColor,
                ),
              )
            ],
          ),
        ));
  }
}
