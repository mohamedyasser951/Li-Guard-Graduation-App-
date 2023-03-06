import 'package:asps/Data/Models/general_model.dart';

abstract class RegisterStates {}

class RegisterIntialState extends RegisterStates {}

//Register
class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final GenralModel registerModel;
  RegisterSuccessState({required this.registerModel});
}

class RegisterErrorState extends RegisterStates {}
