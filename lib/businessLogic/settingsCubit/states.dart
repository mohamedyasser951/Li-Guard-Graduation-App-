import 'package:asps/Data/Models/general_model.dart';
import 'package:asps/Data/Models/get_userData_model.dart';

abstract class SettingsStates {}

class SettingsInitial extends SettingsStates {}

//ResetPassword
class ResetPasswordLoadingState extends SettingsStates {}

class ResetPasswordSuccessState extends SettingsStates {
  final GenralModel genralModel;
  ResetPasswordSuccessState({required this.genralModel});
}

class ResetPasswordErrorState extends SettingsStates {}

//GetUserData
class GetUserDataLoadingState extends SettingsStates {}

class GetUserDataSuccessState extends SettingsStates {
  final UserDataModel userDataModel;
  GetUserDataSuccessState({required this.userDataModel});
}

class GetUserDataErrorState extends SettingsStates {}

//Update UserData

class UpdateUserDataLoadingState extends SettingsStates {}

class UpdateUserDataSuccessState extends SettingsStates {
  final GenralModel model;
  UpdateUserDataSuccessState({required this.model});
}

class UpdateUserDataErrorState extends SettingsStates {}

