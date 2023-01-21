import 'package:asps/screens/login/forget_password_by_email/forgetPasswordEmailReset.dart';
import 'package:asps/screens/login/forget_password_by_mobile/forgetPasswordMobileReset.dart';
import 'package:asps/screens/login/login_screen.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PasswordReset extends StatelessWidget {
  const PasswordReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Password Reset",
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                "Choose how you want to reset your\npassword",
                style:
                    Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Center(
                child: Image(
                  image: AssetImage("assets/images/passRest_img.png"),
                  height: 260,
                  width: 270,
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              InkWell(
                onTap: () {
                  navigateTo(context, ForgetPasswordEmailReset());
                },
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 57,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff121D43)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.mail,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Continue with email",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: () {
                  navigateTo(context, ForgetPasswordmobileReset());
                },
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 57,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff121D43)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.phone_android,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Continue with mobile",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
