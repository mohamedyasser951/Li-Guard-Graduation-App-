import 'package:asps/main.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/SquareTextField.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/customizedTextField.dart';
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
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
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
                  icon: const Icon(Icons.arrow_back,size: 35,),),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  "Hello,\nGet started!",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                ),
              ),
              Expanded(
                  child: Container(
                      child: StepIndicatorPageView(
                          activeBorderColor: primaryColor,
                          activeNodeColor: primaryColor,
                          activeLineColor: primaryColor,
                          steps: 4,
                          controller: _pageController,
                          physics: const BouncingScrollPhysics(),
                          completedIcon: Icons.done,
                          iconColor: Colors.white,
                          iconSize: 15,
                          nodeSize: 20.0,
                          backgroundColor: Theme.of(context).backgroundColor,
                          complete: () {
                            if (idController.text.isNotEmpty) {
                              return Future.value(true);
                            }
                            return Future.value(false);
                          },
                          children: [
                    Page1(idController: idController),
                    Page2(
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                    ),
                    Page3(
                      emailController: emailController,
                    ),
                    Page4(pageController: _pageController),
                  ])))
            ],
          ),
        ),
      )),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({
    Key? key,
    required PageController pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            const Text(
                "Enter the verification code we just \n sent on your email address.",
                textAlign: TextAlign.center),
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
                const Text("Didn't get a code?"),
                TextButton(
                    onPressed: () {},
                    child:
                        Text("Resend", style: TextStyle(color: primaryColor))),
              ],
            ),
            const Spacer(),
            CustomizedButton(
              buttonText: "Verify",
              textColor: Colors.white,
              onPressed: () {
                
              },
              buttonColor: primaryColor,
            ),
          ],
        ));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key, required this.emailController}) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10),
              child: CustomizedTextField(
                  controller: emailController,
                  
                  validator: (val) => null,
                  label: "Enter your email",
                  prefixIcon: Icons.email),
            ),
            const Spacer(),
            CustomizedButton(
              buttonText: "Countinue",
              textColor: Colors.white,
              onPressed: () {},
              buttonColor: primaryColor,
            ),
          ],
        ));
  }
}

class Page2 extends StatelessWidget {
  const Page2({
    Key? key,
    required this.passwordController,
    required this.confirmPasswordController,
  }) : super(key: key);

  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10),
              child: CustomizedTextField(
                controller: passwordController,
               
                validator: (val) => null,
                label: "Password",
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: CustomizedTextField(
                controller: confirmPasswordController,
                
                validator: (val) => null,
                label: "Confirm Password",
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility,
              ),
            ),
            // const SizedBox(
            //   height: 20.0,
            // ),
            Spacer(),
            CustomizedButton(
              buttonText: "Countinue",
              textColor: Colors.white,
              onPressed: () {},
              buttonColor: primaryColor,
            )
          ],
        ));
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    Key? key,
    required this.idController,
  }) : super(key: key);

  final TextEditingController idController;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: CustomizedTextField(
                  controller: idController,
                  
                  validator: (val) => null,
                  label: "Enter your id",
                  prefixIcon: Icons.person),
            ),
            const Spacer(),
            CustomizedButton(
              buttonText: "Countinue",
              textColor: Colors.white,
              onPressed: () {},
              buttonColor: primaryColor,
            ),
            TextButton(
                onPressed: () {}, child: const Text("I have an account!")),
          ],
        ));
  }
}
