import 'package:asps/businessLogic/LayoutCubit/cubit.dart';
import 'package:asps/businessLogic/VisitorCubit/VisitorCubit.dart';
import 'package:asps/businessLogic/VisitorCubit/states.dart';
import 'package:asps/screens/visitor/inivitation_code/invite_code1.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/widgets/customized_button.dart';
import 'package:asps/shared/widgets/customized_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Setup extends StatelessWidget {
  Setup({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phonenNamberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Fill Your Profile",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Don't worry, you can always change it later.",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 50,
            ),
            Image.asset("assets/images/setup_img.png"),
            const SizedBox(
              height: 50,
            ),
            CustomizedTextField(
                controller: nameController,
                validator: (val) {},
                label: "FullName",
                prefixIcon: Icons.person),
            const SizedBox(
              height: 10,
            ),
            CustomizedTextField(
                controller: TextEditingController(),
                validator: (val) {},
                label: "Nickname",
                prefixIcon: Icons.person),
            const SizedBox(
              height: 10,
            ),
            IntlPhoneField(
                controller: phonenNamberController,
                decoration: InputDecoration(
                    fillColor: LayoutCubit.get(context).isDark
                        ? const Color(0xff1F222A)
                        : Colors.white,
                    filled: true,
                    labelText: "Phone Number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          width: 0.0,
                          color: LayoutCubit.get(context).isDark
                              ? const Color(0xff1F222A)
                              : Colors.white,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          width: 0.0,
                          color: LayoutCubit.get(context).isDark
                              ? const Color(0xff1F222A)
                              : Colors.white,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          width: 0.0,
                          color: LayoutCubit.get(context).isDark
                              ? const Color(0xff1F222A)
                              : Colors.white,
                        )))),
            const SizedBox(height: 60),
            BlocProvider.value(
              value: VisitorCubit(),
              child: BlocBuilder<VisitorCubit, VisitorStates>(
                builder: (context, state) {
                  return CustomizedButton(
                      buttonText: "Continue",
                      textColor: Colors.white,
                      onPressed: () {
                        navigateTo(context, InviteCodePageOne());
                        // VisitorCubit.get(context)
                        //     .getVisitorImage()
                        //     .then((value) {
                        //   customizedSuccessDialog(context);
                        //   Future.delayed(Duration(seconds: 2)).then((value) {
                        //     navigateAndKill(context, InviteCodePageOne());
                        //   });
                        // });
                      });
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
