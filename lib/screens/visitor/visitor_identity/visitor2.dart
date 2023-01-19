

import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/customizedTextField.dart';
import 'package:flutter/material.dart';


class VisitorScreen2 extends StatefulWidget {
 const VisitorScreen2({super.key});

  @override
  State<VisitorScreen2> createState() => _VisitorScreen2State();
}

class _VisitorScreen2State extends State<VisitorScreen2> {
  TextEditingController emailController = TextEditingController();

  bool reson1 = false;

  bool reson2 = false;

  bool reson3 = false;

  bool reson4 = false;

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
        child: ListView(
          
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
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
                      height: 8.0,
                    ),
                    Text(
                      "we are required to verify your identity before\nyou can use the service",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    CustomizedTextField(
                        controller: emailController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "email must be entered";
                          }
                          return null;
                        },
                        label: "Email",
                        prefixIcon: Icons.email),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "The reason you're here",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                  
                      children: [
                        Checkbox(
                          splashRadius: 100.0,
                        
                            value: reson1,
                            onChanged: (val) {
                              setState(() {
                                reson1 = val!;
                              });
                            }),
                        const Text("Your are here because"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: reson2,
                            onChanged: (val) {
                              setState(() {
                                reson2 = val!;
                              });
                            }),
                       const Text("Your are here because"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: reson3,
                            onChanged: (val) {
                              setState(() {
                                reson3 = val!;
                              });
                            }),
                       const Text("Your are here because"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: reson4,
                            onChanged: (val) {
                              setState(() {
                                reson4 = val!;
                              });
                            }),
                       const Text("Your are here because"),
                      ],
                    ),
                    Container(
                      height: 120.0,
                      decoration: BoxDecoration(
                        
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          
                          decoration:  InputDecoration(
                            prefixIconConstraints: const BoxConstraints(maxWidth: 24),
                            prefixIcon:  Icon(Icons.description_outlined, size: 20,color: iconColor,),
                            border: InputBorder.none,
                            
                           
                           
                            hintText: "Case your visit here",
                            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black)
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
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
          ],
        ),
      ),
    );
  }
}