import 'package:asps/businessLogic/settingsCubit/cubit.dart';
import 'package:asps/businessLogic/settingsCubit/states.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/settingAppBar.dart';
import 'package:asps/shared/widgets/settingsTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final TextEditingController firstnameController = TextEditingController();

  final TextEditingController secondnameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController countryController = TextEditingController();

  final TextEditingController numberController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: SettingsCubit.get(context),
      child: Builder(builder: (context) {
        return Scaffold(
            backgroundColor:Theme.of(context).colorScheme.background,
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(56.0),
                child: SettingsAppBar(
                  title: "Edit Profile",
                )),
            body: BlocConsumer<SettingsCubit, SettingsStates>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is GetUserDataSuccessState) {
                  var data = state.userDataModel.data;
                  firstnameController.text = state.userDataModel.data!.userName!
                      .split(" ")[0]
                      .toString();
                  secondnameController.text =
                      data!.userName!.split(" ")[1].toString();
                  emailController.text = data.userEmail!;
                  numberController.text = data.userPhone!;
                  countryController.text = "Egypt";
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 22.0,
                            ),
                            SettingTextField(
                              controller: firstnameController,
                              text: "First Name",
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "* This field this required";
                                }
                                return null;
                              },
                            ),
                            SettingTextField(
                              controller: secondnameController,
                              text: "Seconde Name",
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "* This field this required";
                                }
                                return null;
                              },
                            ),
                            SettingTextField(
                              controller: emailController,
                              text: "Email",
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "* This field this required";
                                }
                                return null;
                              },
                            ),
                            SettingTextField(
                              controller: countryController,
                              text: "Country",
                              suffixIcon: const Icon(Icons.keyboard_arrow_down),
                              suffixPress: null,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "* This field this required";
                                }
                                return null;
                              },
                            ),
                            SettingTextField(
                              controller: numberController,
                              text: "Phone",
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "* This field this required";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            CustomizedButton(
                              buttonText: "Update",
                              buttonColor: primaryColor,
                              textColor: Colors.white,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  SettingsCubit.get(context).updateUserData(
                                      fName: firstnameController.text,
                                      lName: secondnameController.text,
                                      email: emailController.text,
                                      phone: numberController.text);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                  if (state is GetUserDataLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return  Container();
              },
            ));
      }),
    );
  }
}
