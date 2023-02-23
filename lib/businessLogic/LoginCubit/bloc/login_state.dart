import 'package:asps/Data/Models/login_model.dart';

abstract class LoginStates {}

class LoginInitial extends LoginStates {}

// Login States
class LoginSuccessState extends LoginStates {
  final LoginModel model;
  LoginSuccessState({required this.model});
}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState({required this.error});
}
