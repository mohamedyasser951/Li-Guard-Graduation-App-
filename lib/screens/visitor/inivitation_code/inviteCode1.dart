import 'package:asps/screens/visitor/inivitation_code/inviteCode2.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';

class InviteCodePageOne extends StatelessWidget {
  const InviteCodePageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  const SizedBox(
                    height: 80.0,
                  ),
                  Center(
                    child: Text(
                      "Select Company",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Please enter your invitation code below to join \nnew campany",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  const Image(
                    image: AssetImage("assets/images/inviteCode1_img.png"),
                    height: 300,
                    width: 280,
                  ),
                ]))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateTo(context, InviteCodePageTwo());
        },
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
