import 'package:asps/Data/Models/login_model.dart';
import 'package:asps/businessLogic/LoginCubit/bloc/login_state.dart';
import 'package:asps/shared/network/remote/end_points.dart';
import 'package:asps/shared/network/remote/http_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    var data = Crud.postRequest(
        USERLOGIN, {"email": "Karim@gmail.com", "password": "Asslo10923!DD12"});
        
    print(data);
    
    // await DioHelper.postData(
    //         url: USERLOGIN,
    //         data: {"email": "Karim@gmail.com","password": "Asslo10923!DD12"})
    //     .then((value) {
    //   // loginModel = LoginModel.fromJson(value.data);
    //   print("success from possssts");
    //   print(value.data);
    //   emit(LoginSuccessState());
    // }).catchError((error) {
    //   print(error.toString());
    //   emit(LoginErrorState(error: error.toString()));
    // });
  }
}
