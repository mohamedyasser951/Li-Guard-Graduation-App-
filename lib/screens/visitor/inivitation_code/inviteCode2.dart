import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/customizedTextField.dart';
import 'package:flutter/material.dart';

class InviteCodePageTwo extends StatelessWidget {
  const InviteCodePageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController inviteCodeController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: iconColor,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: Text(
                      "Join Company",
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
                    height: 20.0,
                  ),
                  const Image(
                    image: AssetImage("assets/images/inviteCode2_img.png"),
                    height: 230,
                    width: 320,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: inviteCodeController,
                    decoration: InputDecoration(
                        hintText: "Enter invite code (XXXX)",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintStyle: const TextStyle(
                            color: Color(0xFF121D43),
                            fontWeight: FontWeight.w400),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              width: 0.0,
                              color: backgroundColor,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              width: 0.0,
                              color: backgroundColor,
                            ))),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomizedButton(
                      buttonText: "Submit",
                      buttonColor: primaryColor,
                      textColor: Colors.white,
                      onPressed: () {})
                ]))),
      ),
    );
  }
}
