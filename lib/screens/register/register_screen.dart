import 'package:asps/businessLogic/RegisterCubit/register_bloc.dart';
import 'package:asps/businessLogic/RegisterCubit/register_states.dart';
import 'package:asps/screens/homeLayout/homeLayout.dart';
import 'package:asps/screens/register/registerScreens/page1.dart';
import 'package:asps/screens/register/registerScreens/page2.dart';
import 'package:asps/screens/register/registerScreens/page3.dart';
import 'package:asps/screens/register/registerScreens/page4.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/successDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linear_step_indicator/linear_step_indicator.dart';

class RegisterSccreen extends StatefulWidget {
  const RegisterSccreen({super.key});

  @override
  State<RegisterSccreen> createState() => _RegisterSccreenState();
}

class _RegisterSccreenState extends State<RegisterSccreen> {
  final PageController _pageController = PageController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController otoController = TextEditingController();

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.registerModel.flag == 1) {
              customizedSuccessDialog(context);
              Future.delayed(const Duration(seconds: 4)).then((value) {
                navigateTo(context, const HomeLayout());
              });
            }
          }
        },
        builder: (context, state) {
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
                          // Navigator.of(context).pop();
                          _pageController.previousPage(
                              curve: Curves.easeInCubic,
                              duration: const Duration(microseconds: 500));
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
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
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
                            backgroundColor:
                                Theme.of(context).colorScheme.background,
                            complete: () {
                              if (true) {
                                return Future.value(true);
                              }
                            },
                            children: [
                              Page1(
                                  emailController: emailController,
                                  nameController: nameController,
                                  pageController: _pageController),
                              Page2(
                                passwordController: passwordController,
                                confirmPasswordController:
                                    confirmPasswordController,
                                pageController: _pageController,
                              ),
                              Page3(
                                phoneController: phoneController,
                                emailController: emailController,
                                pageController: _pageController,
                              ),
                              Page4(
                                pageController: _pageController,
                                phoneController: phoneController,
                                emailController: emailController,
                                nameController: nameController,
                                passwordController: passwordController,
                                confirmPasswordController:
                                    confirmPasswordController,
                              ),
                            ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
