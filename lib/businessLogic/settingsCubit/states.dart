import 'package:asps/Data/Models/general_model.dart';

abstract class SettingsStates {}

class SettingsInitial extends SettingsStates {}

//ResetPassword
class ResetPasswordLoadingState extends SettingsStates {}

class ResetPasswordSuccessState extends SettingsStates {
  final GenralModel genralModel;
  ResetPasswordSuccessState({required this.genralModel});
}

class ResetPasswordErrorState extends SettingsStates {}
