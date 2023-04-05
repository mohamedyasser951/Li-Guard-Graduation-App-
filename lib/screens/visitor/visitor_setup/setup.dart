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

  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController phonenNamberController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocConsumer<VisitorCubit, VisitorStates>(
        listener: (context, state) {
          if (state is VisitorRegisterSuccessState) {
            if (state.model.flag == 1 &&
                VisitorCubit.get(context).identyCardImage != null &&
                VisitorCubit.get(context).visitorImage != null) {
              navigateAndKill(context, const InviteCodePageOne());
            }
          }
        },
        builder: (context, state) {
          var cubit = VisitorCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Fill Your Profile",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
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
                      InkWell(
                        onTap: () {
                          cubit.getVisitorImage();
                        },
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Image.asset("assets/images/setup_img.png"),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).colorScheme.background,
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                color: Theme.of(context).iconTheme.color,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomizedTextField(
                          controller: fNameController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "*first name required";
                            }
                            return null;
                          },
                          label: "First Name",
                          prefixIcon: Icons.person),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomizedTextField(
                          controller: lNameController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "*last name required";
                            }
                            return null;
                          },
                          label: "Last name",
                          prefixIcon: Icons.person),
                      const SizedBox(
                        height: 10,
                      ),
                      IntlPhoneField(
                          controller: phonenNamberController,
                          validator: (val) {
                            if (val!.completeNumber.isNotEmpty) {
                              return "*phone number required";
                            }
                            return null;
                          },
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
                      const SizedBox(height: 40),
                      state is VisitorRegisterLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomizedButton(
                              buttonText: "Continue",
                              textColor: Colors.white,
                              onPressed: () {
                                if (formKey.currentState!.validate() &&
                                    cubit.identyCardImage != null &&
                                    cubit.visitorImage != null) {
                                  String name = fNameController.text +
                                      lNameController.text;
                                  cubit.visitorRegister(
                                      email: "mohamedhcjdivdjvy@gmail.com",
                                      name: name,
                                      phone: phonenNamberController.text);
                                }
                              })
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
