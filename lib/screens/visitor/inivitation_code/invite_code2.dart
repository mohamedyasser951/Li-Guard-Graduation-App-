import 'package:asps/businessLogic/LayoutCubit/cubit.dart';
import 'package:asps/businessLogic/VisitorCubit/visitor_cubit.dart';
import 'package:asps/businessLogic/VisitorCubit/states.dart';
import 'package:asps/screens/homeLayout/home_layout.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customized_button.dart';
import 'package:asps/shared/widgets/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InviteCodePageTwo extends StatelessWidget {
  const InviteCodePageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController inviteCodeController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
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
                      style: Theme.of(context).textTheme.headlineMedium,
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
                        .bodySmall!
                        .copyWith(fontSize: 16),
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
                  BlocConsumer<VisitorCubit, VisitorStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return TextFormField(
                        controller: inviteCodeController,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        obscuringCharacter: '●',
                        decoration: InputDecoration(
                            hintText: "Enter invite code (XXXX)",
                            fillColor: LayoutCubit.get(context).isDark
                                ? const Color(0xff1F222A)
                                : Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  width: 0.0,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  width: 0.0,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ))),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomizedButton(
                      buttonText: "Submit",
                      buttonColor: primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        if (inviteCodeController.text.isNotEmpty) {
                          if (int.parse(inviteCodeController.text) ==
                              VisitorCubit.get(context)
                                  .visitorModel!
                                  .inviteCode) {
                            customizedSuccessDialog(context,"home").then((value) {});
                            Future.delayed(const Duration(seconds: 3))
                                .then((value) {
                              navigateAndKill(context, const HomeLayout());
                            });
                          } else {
                            showToast(
                                message:
                                    "Please check your email and enter Correct Invite Code",
                                state: ToastState.error);
                          }
                        }
                      })
                ]))),
      ),
    );
  }
}
