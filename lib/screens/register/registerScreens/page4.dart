import 'package:asps/businessLogic/RegisterCubit/register_cubit.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/square_textfield.dart';
import 'package:asps/shared/widgets/customized_button.dart';
import 'package:flutter/material.dart';

class Page4 extends StatefulWidget {
  final PageController pageController;
  final TextEditingController phoneController;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController emailController;

  Page4({
    Key? key,
    required this.pageController,
    required this.emailController,
    required this.nameController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
  }) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  final TextEditingController contrller1 = TextEditingController();

  final TextEditingController contrller2 = TextEditingController();

  final TextEditingController contrller3 = TextEditingController();

  final TextEditingController contrller4 = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  int timerCount = 59;

  // countDownTimer() async {
  //   for (int x = 59; x > 0; x--) {
  //     await Future.delayed(const Duration(seconds: 1)).then((_) {
  //       setState(() {
  //         timerCount -= 1;
  //         print(timerCount);
  //       });
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
  }


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
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SquareTextField(
                      controller: contrller1,
                    ),
                    SquareTextField(
                      controller: contrller2,
                    ),
                    SquareTextField(
                      controller: contrller3,
                    ),
                    SquareTextField(
                      controller: contrller4,
                      isLast: true,
                    ),
                  ],
                ),
              ),
              Text("00:$timerCount"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't get a code?",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton(
                      onPressed: () {
                        if (timerCount == 0) {
                          RegisterCubit.get(context)
                              .sendOTP(email: widget.emailController.text);
                        }
                      },
                      child: Text("Resend",
                          style: TextStyle(color: primaryColor))),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomizedButton(
                  buttonText: "Verify",
                  textColor: Colors.white,
                  onPressed: () async {
                    String otpCode = contrller1.text +
                        contrller2.text +
                        contrller3.text +
                        contrller4.text;
                    if (formkey.currentState!.validate()) {
                      RegisterCubit.get(context)
                          .verifyOtp(
                        otpCode: otpCode,
                      )
                          .then((value) {
                        if (value) {
                          RegisterCubit.get(context).userRegister(
                              name: widget.nameController.text.trim(),
                              phone: widget.phoneController.text.trim(),
                              email: widget.emailController.text.trim(),
                              password: widget.passwordController.text.trim(),
                              repeatPassword:
                                  widget.confirmPasswordController.text.trim());
                        } else {
                          showToast(
                              message: "OTP is invalid",
                              state: ToastState.error);
                        }
                      });
                    }
                  },
                  buttonColor: primaryColor,
                ),
              ),
            ],
          ),
        ));
  }
}
