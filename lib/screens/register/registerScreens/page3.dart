import 'package:asps/businessLogic/RegisterCubit/register_bloc.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/customizedTextField.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  final PageController pageController;
  final TextEditingController phoneController;
  final TextEditingController emailController;

  Page3({
    Key? key,
    required this.phoneController,
    required this.emailController,
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
                    controller: phoneController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "* Phone required";
                      }
                      return null;
                    },
                    label: "Phone",
                    prefixIcon: Icons.phone_android),
                const Spacer(),
                CustomizedButton(
                  buttonText: "Countinue",
                  textColor: Colors.white,
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      RegisterCubit.get(context)
                          .sendOTP(email: emailController.text.trim());
                      pageController.nextPage(
                          curve: Curves.easeInCubic,
                          duration: const Duration(microseconds: 500));
                    }
                  },
                  buttonColor: primaryColor,
                ),
              ],
            ),
          ),
        ));
  }
}
