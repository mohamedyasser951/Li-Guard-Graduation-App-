import 'package:asps/businessLogic/settingsCubit/cubit.dart';
import 'package:asps/businessLogic/settingsCubit/states.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/settingAppBar.dart';
import 'package:asps/shared/widgets/settingsTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingResetPassword extends StatelessWidget {
  final TextEditingController currentPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SettingResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: SettingsAppBar(title: "Reset Password"),
      ),
      body: BlocProvider.value(
        value: SettingsCubit(),
        child: BlocConsumer<SettingsCubit, SettingsStates>(
          listener: (context, state) {
            if (state is ResetPasswordSuccessState) {
              if (state.genralModel.flag == 1) {
                showToast(
                    message: state.genralModel.message!,
                    state: ToastState.sucess);
              }
              if (state.genralModel.flag != 1) {
                showToast(
                    message: state.genralModel.message!,
                    state: ToastState.error);
              }
            }
          },
          builder: (context, state) {
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
                          controller: currentPassController,
                          isPassword: true,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "* This field this required";
                            }
                            return null;
                          },
                          text: "Current Password"),
                      SettingTextField(
                          isPassword: true,
                          controller: newPassController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "* This field this required";
                            }
                            return null;
                          },
                          text: "New Password"),
                      SettingTextField(
                          isPassword: true,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "* This field this required";
                            }
                            return null;
                          },
                          controller: confirmPassController,
                          text: "Confirm New Password"),
                      const SizedBox(height: 20,),
                      state is ResetPasswordLoadingState
                          ? Center(
                              child: CircularProgressIndicator(
                                  color: primaryColor),
                            )
                          : CustomizedButton(
                              buttonText: "Update Password",
                              textColor: Colors.white,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  SettingsCubit.get(context).resetPassword(
                                      password:
                                          currentPassController.text.trim(),
                                      newPassword:
                                          newPassController.text.trim(),
                                      conPassword:
                                          confirmPassController.text.trim());
                                }
                              })
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
