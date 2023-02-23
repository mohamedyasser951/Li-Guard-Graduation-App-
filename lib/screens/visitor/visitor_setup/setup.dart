import 'package:asps/businessLogic/VisitorCubit/VisitorCubit.dart';
import 'package:asps/businessLogic/VisitorCubit/states.dart';
import 'package:asps/screens/visitor/visitor_setup/faceCaptureScreen.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Setup extends StatelessWidget {
 const Setup({super.key});

  // TextEditingController nameController = TextEditingController();
  // TextEditingController phonenNamberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 100,
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
            TextFormField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'FullName',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        width: 0.0,
                        color: backgroundColor,
                      ))
                      ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Nickname',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        width: 0.0,
                        color: backgroundColor,
                      ))),
            ),
            const SizedBox(
              height: 10,
            ),
            IntlPhoneField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          width: 0.0,
                          color: backgroundColor,
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
                        navigateTo(context, FaceCaptureScreen());
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
