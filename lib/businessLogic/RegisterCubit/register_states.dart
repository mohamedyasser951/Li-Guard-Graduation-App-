import 'package:asps/Data/Models/general_model.dart';

abstract class RegisterStates {}

class RegisterIntialState extends RegisterStates {}

//Change Visibility

class ChanegVisibilityState extends RegisterStates {}

//User Register
class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final GenralModel registerModel;
  RegisterSuccessState({required this.registerModel});
}

class RegisterErrorState extends RegisterStates {}

// uploadImage

class UPloadImageLoadingState extends RegisterStates {}

class UPloadImageSuccessState extends RegisterStates {
  final GenralModel imageUploadModel;
  UPloadImageSuccessState({required this.imageUploadModel});
}

class UPloadImageErrorState extends RegisterStates {}
