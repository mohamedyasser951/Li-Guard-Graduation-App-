import 'package:asps/homeLayout/homeLayout.dart';
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
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
              ),
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
                            if (true) {
                              customizedSuccessDialog(context);
                              Future.delayed(const Duration(seconds: 3))
                                  .then((value) {
                                navigateAndKill(context, HomeLayout());
                              });
                              return Future.value(true);
                            }
                          
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
                onPressed: () {},
                buttonColor: primaryColor,
              ),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: CustomizedTextField(
                controller: passwordController,
                validator: (val) => null,
                label: "Password",
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomizedButton(
                buttonText: "Countinue",
                textColor: Colors.white,
                onPressed: () {},
                buttonColor: primaryColor,
              ),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: CustomizedTextField(
                  controller: idController,
                  validator: (val) => null,
                  label: "Enter your id",
                  prefixIcon: Icons.person),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomizedButton(
                buttonText: "Countinue",
                textColor: Colors.white,
                onPressed: () {},
                buttonColor: primaryColor,
              ),
            ),
            TextButton(
                onPressed: () {}, child: const Text("I have an account!")),
          ],
        ));
  }
}

Future customizedSuccessDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return Container(
          // width: MediaQuery.of(context).size.width / 1.3,
          // height: MediaQuery.of(context).size.height / 2.5,
          // decoration: const BoxDecoration(
          //   shape: BoxShape.rectangle,
          
          //   borderRadius: BorderRadius.all(Radius.circular(32.0)),
          // ),
          child: Dialog(
            insetPadding:const EdgeInsets.symmetric(horizontal: 25.0),
            alignment: Alignment.center,
            elevation: 0.0,
             shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              height: 470,
              width: 400,
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(40.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/images/congra_image.png"),
                  ),
                  const SizedBox(
                    height: 22.0,
                  ),
                  Text(
                    "Congratulations!",
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Your account is ready to use. You will \n be redirected to the home page in \n a  few saconds..",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 90,
                    width: 90,
                    child: CircularProgressIndicator(
                    
                      backgroundColor:const Color(0xffCCCCCC),
                      strokeWidth: 8.0,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
