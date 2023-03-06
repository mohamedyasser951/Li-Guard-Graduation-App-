import 'package:asps/Data/Models/general_model.dart';
import 'package:asps/Data/Models/get_userData_model.dart';
import 'package:asps/businessLogic/settingsCubit/states.dart';
import 'package:asps/shared/network/local/shared_helper.dart';
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
      "verNewPassword": conPassword,
    }).then((value) {
      genralModel = GenralModel.fromJson(value);
      print("Reset PASSSS $value");
      emit(ResetPasswordSuccessState(genralModel: genralModel));
    }).catchError((error) {
      print(error.toString());
      emit(ResetPasswordErrorState());
    });
  }

  late UserDataModel userDataModel;
  getUserData() async {
    emit(GetUserDataLoadingState());
    await Crud.getReguest(GETUSERDATA).then((value) async {
      userDataModel = UserDataModel.fromJson(value);
      print("get userData $value");
      if (Email == null) {
        Email = userDataModel.data!.userEmail;
        await SharedHelper.saveData(
                key: "email", value: userDataModel.data!.userEmail)
            .then((value) {
          print("email saved in shared $value");
        });
      }
      emit(GetUserDataSuccessState(userDataModel: userDataModel));
    }).catchError((error) {
      emit(GetUserDataErrorState());
    });
  }

  late GenralModel model;
  updateUserData({
    required String fName,
    required String lName,
    required String email,
    required String phone,
  }) async {
    emit(UpdateUserDataLoadingState());
    await Crud.postRequest(UPDATEUSERDATA, {
      "f_name": fName,
      "l_name": lName,
      "email": email,
      "phone": phone
    }).then((value) {
      model = GenralModel.fromJson(value);
      print("update USERDATA ${value}");
      getUserData();
      // emit(UpdateUserDataSuccessState(model: model));
    }).catchError((error) {
      print(error.toString());
      emit((UpdateUserDataErrorState()));
    });
  }
}
