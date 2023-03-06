import 'package:asps/screens/login/login_screen.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customized_button.dart';
import 'package:asps/shared/widgets/customized_textField.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController nameController;

  final PageController pageController;
  Page1({
    Key? key,
    required this.emailController,
    required this.nameController,
    required this.pageController,
  }) : super(key: key);

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.background,
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                CustomizedTextField(
                    controller: nameController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "* Name required";
                      }
                      return null;
                    },
                    label: "Name",
                    prefixIcon: Icons.person),
                const SizedBox(
                  height: 15.0,
                ),
                CustomizedTextField(
                    controller: emailController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "* Email required";
                      }
                      return null;
                    },
                    label: "Email",
                    prefixIcon: Icons.email),
                const Spacer(),
                CustomizedButton(
                  buttonText: "Countinue",
                  textColor: Colors.white,
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      pageController.nextPage(
                          curve: Curves.easeInCubic,
                          duration: const Duration(microseconds: 500));
                    }
                  },
                  buttonColor: primaryColor,
                ),
                TextButton(
                    onPressed: () {
                      navigateTo(context, const Login_screen());
                    },
                    child: const Text("I have an account!")),
              ],
            ),
          ),
        ));
  }
}
