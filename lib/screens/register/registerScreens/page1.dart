import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/customizedTextField.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  final PageController pageController;
  Page1({
    Key? key,
    required this.idController,
    required this.pageController,
  }) : super(key: key);

  final TextEditingController idController;
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
                    controller: idController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "* Email required";
                      }
                      return null;
                    },
                    label: "Email",
                    prefixIcon: Icons.person),
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
              ),
              TextButton(
                  onPressed: () {}, child: const Text("I have an account!")),
            ],
          ),
        ));
  }
}
