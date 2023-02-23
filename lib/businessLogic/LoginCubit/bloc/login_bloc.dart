import 'package:asps/Data/Models/login_model.dart';
import 'package:asps/businessLogic/LoginCubit/bloc/login_state.dart';
import 'package:asps/shared/network/remote/end_points.dart';
import 'package:asps/shared/network/remote/crud.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  late LoginModel loginModel;

  userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    Crud.postRequest(USERLOGIN, {
      "email": email,
      "password": password
    }).then((value) {
      loginModel = LoginModel.fromJson(value);
      emit(LoginSuccessState(model: loginModel));
    }).catchError((e) {
      emit(LoginErrorState(error: e.toString()));
    });
  }
}
