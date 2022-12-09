import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/customizedTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VisitorScreen2 extends StatelessWidget {
  VisitorScreen2({super.key});
  TextEditingController emailController = TextEditingController();

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
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome!",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "we are required to verify your identity before\nyou can use the service",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  CustomizedTextField(
                      controller: emailController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "email must be entered";
                        }
                        return null;
                      },
                      label: "Enter your Email",
                      prefixIcon: Icons.email),
                  const SizedBox(height: 20.0,),
                    Text(
                    "The reason you're here",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),

                  SizedBox(
                    height: 100.0,
                  ),

                  Container(
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLines: 12,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Case your visit here"
                        ),

                        
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 30.0,
                  ),
                  CustomizedButton(
                      buttonText: "Continue",
                      buttonColor: primaryColor,
                      textColor: Colors.white,
                      onPressed: () {})
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
