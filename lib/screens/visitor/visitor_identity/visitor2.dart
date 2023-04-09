import 'package:asps/businessLogic/LayoutCubit/cubit.dart';
import 'package:asps/businessLogic/VisitorCubit/visitor_cubit.dart';
import 'package:asps/businessLogic/VisitorCubit/states.dart';
import 'package:asps/screens/visitor/visitor_setup/setup.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/network/remote/end_points.dart';
import 'package:asps/shared/widgets/customized_button.dart';
import 'package:asps/shared/widgets/customized_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisitorScreen2 extends StatefulWidget {
  const VisitorScreen2({super.key});

  @override
  State<VisitorScreen2> createState() => _VisitorScreen2State();
}

class _VisitorScreen2State extends State<VisitorScreen2> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool reson1 = false;

  bool reson2 = false;

  bool reson3 = false;

  bool reson4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
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
        child: Form(
          key: formKey,
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
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "we are required to verify your identity before\nyou can use the service",
                        style: Theme.of(context).textTheme.bodyLarge,
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
                            .titleLarge!
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
                          const Text(
                            "Your are here because",
                          ),
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
                        height: 110.0,
                        decoration: BoxDecoration(
                            color: LayoutCubit.get(context).isDark
                                ? const Color(0xff35383F)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: TextFormField(
                            maxLines: 4,
                            decoration: InputDecoration(
                                prefixIconConstraints:
                                    const BoxConstraints(maxWidth: 24),
                                prefixIcon: const Icon(
                                  Icons.description_outlined,
                                  size: 20,
                                ),
                                border: InputBorder.none,
                                hintText: "Case your visit here",
                                hintStyle:
                                    Theme.of(context).textTheme.bodyMedium),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      BlocBuilder<VisitorCubit, VisitorStates>(
                        builder: (context, state) {
                          var cubit = VisitorCubit.get(context);
                          return CustomizedButton(
                              buttonText: "Continue",
                              buttonColor: primaryColor,
                              textColor: Colors.white,
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  EMAIL = emailController.text.trim();
                                  cubit.getIdentyImage().then((value) {
                                    if (cubit.identyCardImage != null) {
                                      visitorSuccessDialog(context);
                                    }
                                  });
                                }
                              });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future visitorSuccessDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            
            insetPadding: const EdgeInsets.symmetric(horizontal: 25.0),
            alignment: Alignment.center,
          
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              height: 400,
              width: 395,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
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
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "Your request is being reviewed,\ndont forget to check your email",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 38,
                      child: CustomizedButton(
                          buttonText: "Done",
                          textColor: Colors.white,
                          onPressed: () {
                            navigateAndKill(context, Setup());
                          }),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
}
