import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  final Widget startWidget;
  const SplashScreen({super.key,required this.startWidget});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    Future.delayed(const Duration(seconds: 4)).then((value) {
      navigateAndKill(context, widget.startWidget);
    });
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    super.dispose();
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
              Text(
                "Li Guard",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              // Image(
              //     image: AssetImage("assets/images/text_splash.png"),
              //     height: 100.0),
            ]),
      ),
    );
  }
}
