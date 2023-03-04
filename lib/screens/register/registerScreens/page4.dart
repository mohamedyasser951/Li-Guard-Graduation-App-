import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/SquareTextField.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
    final PageController pageController;

   Page4({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.background,
        child: Form(
          key: formkey,
          child: Column(
            children: [
               Text(
                  "Enter the verification code we just \n sent on your email address.",
                  textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyLarge,),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    SquareTextField(),
                    SquareTextField(),
                    SquareTextField(),
                    SquareTextField(),
                  ],
                ),
              ),
              const Text("00:34"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text("Didn't get a code?",style: Theme.of(context).textTheme.bodyMedium,),
                  TextButton(
                      onPressed: () {},
                      child:
                          Text("Resend", style: TextStyle(color: primaryColor))),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomizedButton(
                  buttonText: "Verify",
                  textColor: Colors.white,
                  onPressed: () async {},
                  buttonColor: primaryColor,
                ),
              ),
            ],
          ),
        ));
  }
}

