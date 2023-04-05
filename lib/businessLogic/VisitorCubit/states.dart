import 'package:asps/Data/Models/general_model.dart';

abstract class VisitorStates {}

class VisitorInitState extends VisitorStates {}

class VisitorUplaodImageSuceessState extends VisitorStates {}

class VisitorUplaodImageErrorState extends VisitorStates {}

// Visitor Register

class VisitorRegisterLoadingState extends VisitorStates {}

class VisitorRegisterSuccessState extends VisitorStates {
  late GenralModel model;
  VisitorRegisterSuccessState({required this.model});
}

class VisitorRegisterErrorState extends VisitorStates {}
