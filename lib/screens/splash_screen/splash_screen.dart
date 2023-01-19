import 'package:asps/screens/onboarding/onboarding_Screen.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import "package:flutter/material.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      navigateAndKill(context,const Onboarging());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                  image: AssetImage(
                    "assets/images/logo_splash.png",
                  ),
                  height: 170.0),
              SizedBox(
                height: 8.0,
              ),
              Image(
                  image: AssetImage("assets/images/text_splash.png"),
                  height: 100.0),
            ]),
      ),
    );
  }
}
