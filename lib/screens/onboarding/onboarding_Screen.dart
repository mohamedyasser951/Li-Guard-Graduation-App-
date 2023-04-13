import 'package:asps/screens/login_or_register/login_or_register.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/network/local/shared_helper.dart';

import 'package:flutter/material.dart';

class Onboarging extends StatefulWidget {
  const Onboarging({Key? key}) : super(key: key);

  @override
  State<Onboarging> createState() => _OnboargingState();
}

class _OnboargingState extends State<Onboarging> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Onboard> demoData = [
    Onboard(
        title: "Detect Strangers",
        description:
            "The app detects and knews anyone who enters the organization",
        image: "assets/images/1photo.png"),
    Onboard(
        title: "Enter your Key",
        description: "",
        image: "assets/images/2photo.png"),
    Onboard(
        title: "Face Recgnation",
        description: "",
        image: "assets/images/3photo.png"),
    Onboard(
        title: "Light and Dark mode",
        description: "",
        image: "assets/images/4photo.png"),
  ];

  bool isLast = false;
  void submitStateOFOnboarding() {
    SharedHelper.saveData(key: "onboard", value: true).then((value) {
      if (value) {
        navigateAndKill(context, const LoginOrRegister());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              children: [
                Expanded(
                  child: SafeArea(
                      child: PageView.builder(
                    onPageChanged: (value) {
                      if (value == demoData.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                    itemCount: demoData.length,
                    controller: _pageController,
                    itemBuilder: (context, index) => OnboardContent(
                      image: demoData[index].image,
                      title: demoData[index].title,
                      description: demoData[index].description,
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            submitStateOFOnboarding();
                          },
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      const Spacer(),
                      SizedBox(
                          height: 43,
                          width: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              if (isLast) {
                                submitStateOFOnboarding();
                              } else {
                                _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: const CircleBorder(),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.title,
    required this.image,
    required this.description,
  }) : super(key: key);

  final String title, image, description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // const Spacer(),
              const SizedBox(
                height: 80,
              ),
              Image.asset(
                image,
                height: 250,
                // width: 200,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                child: Text(description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
              //  const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
