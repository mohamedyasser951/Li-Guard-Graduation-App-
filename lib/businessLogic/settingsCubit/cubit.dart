import 'package:asps/Data/Models/general_model.dart';
import 'package:asps/businessLogic/settingsCubit/states.dart';
import 'package:asps/shared/network/remote/crud.dart';
import 'package:asps/shared/network/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit() : super(SettingsInitial());

  static SettingsCubit get(context) => BlocProvider.of(context);

  late GenralModel genralModel;
  resetPassword({
    required String password,
    required String newPassword,
    required String conPassword,
  }) async {
    emit(ResetPasswordLoadingState());
   await Crud.postRequest(RESETPASSWORD, {
      "password": password,
      "newPassword": newPassword,
      "verNewPassword":conPassword,
    }).then((value) {
      genralModel = GenralModel.fromJson(value);
      print("Reset PASSSS ${value}");
      emit(ResetPasswordSuccessState(genralModel: genralModel));
    }).catchError((error) {
      print(error.toString());
      emit(ResetPasswordErrorState());
    });
  }
}
