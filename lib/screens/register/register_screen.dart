import 'package:asps/screens/homeLayout/homeLayout.dart';
import 'package:asps/screens/register/registerScreens/page1.dart';
import 'package:asps/screens/register/registerScreens/page2.dart';
import 'package:asps/screens/register/registerScreens/page3.dart';
import 'package:asps/screens/register/registerScreens/page4.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/successDialog.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:linear_step_indicator/linear_step_indicator.dart';

class RegisterSccreen extends StatefulWidget {
  const RegisterSccreen({super.key});

  @override
  State<RegisterSccreen> createState() => _RegisterSccreenState();
}

class _RegisterSccreenState extends State<RegisterSccreen> {
  final PageController _pageController = PageController();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  EmailOTP myauth = EmailOTP();
// me@rohitchouhan.com
  void sendOTP() async {
    myauth.setConfig(
        appEmail: "me@rohitchouhan.com",
        appName: "ASPS Email OTP",
        userEmail: emailController.text.trim(),
        otpLength: 4,
        otpType: OTPType.digitsOnly);

    await myauth.sendOTP();
  }

  void verifyOtp() async {
    int inputOTP = 4430;
    await myauth.verifyOTP(otp: inputOTP);
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                
              
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
              ),
              InkWell(
                onTap: () => verifyOtp(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    "Hello,\nGet started!",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                  ),
                ),
              ),
              Expanded(
                  child: StepIndicatorPageView(
                      activeBorderColor: primaryColor,
                      activeNodeColor: primaryColor,
                      activeLineColor: primaryColor,
                      steps: 4,
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      completedIcon: Icons.done,
                      iconColor: Colors.white,
                      iconSize: 15,
                      nodeSize: 20.0,
                      backgroundColor: Theme.of(context).colorScheme.background,
                      complete: () {
                        if (true) {
                          // customizedSuccessDialog(context);
                          // Future.delayed(const Duration(seconds: 3))
                          //     .then((value) {
                          //   navigateAndKill(context, const HomeLayout());
                          // });
                           return Future.value(true);
                        }
                      },
                      children: [
                    Page1(idController: idController,pageController: _pageController),
                    Page2(
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                      pageController: _pageController,
                    ),
                    Page3(
                      emailController: emailController,
                      pageController: _pageController,
                    ),
                    Page4(pageController: _pageController),
                  ]))
            ],
          ),
        ),
      )),
    );
  }
}
