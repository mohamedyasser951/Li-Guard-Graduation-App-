import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/customizedTextField.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  final PageController pageController;

  Page3({
    Key? key,
    required this.emailController,
    required this.pageController,
  }) : super(key: key);

  final TextEditingController emailController;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                    controller: emailController,
                    validator: (val) => null,
                    label: "Enter your email",
                    prefixIcon: Icons.email),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomizedButton(
                  buttonText: "Countinue",
                  textColor: Colors.white,
                  onPressed: () {
                    pageController.nextPage(
                        curve: Curves.easeInCubic,
                        duration: const Duration(microseconds: 500));
                  },
                  buttonColor: primaryColor,
                ),
              ),
            ],
          ),
        ));
  }
}
