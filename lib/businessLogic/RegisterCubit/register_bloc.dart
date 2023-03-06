import 'dart:io';
import 'package:asps/Data/Models/general_model.dart';
import 'package:asps/businessLogic/RegisterCubit/register_states.dart';
import 'package:asps/shared/network/remote/crud.dart';
import 'package:asps/shared/network/remote/end_points.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterIntialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  // var picker = ImagePicker();

  // File? userImage;

  // getUserImage() async {
  //   var pickedImage = await picker.pickImage(source: ImageSource.camera);
  //   if (pickedImage != null) {
  //     userImage = File(pickedImage.path);
  //   } else {
  //     print("error when picked Image");
  //   }
  // }

  EmailOTP myauth = EmailOTP();
  Future sendOTP({
    required String email,
  }) async {
    myauth.setConfig(
        appEmail: "me@rohitchouhan.com",
        appName: "ASPS",
        userEmail: email,
        otpLength: 4,
        otpType: OTPType.digitsOnly);

    await myauth.sendOTP();
  }

  Future verifyOtp({
    required String otpCode,
  }) async {
    String code = otpCode;
    return await myauth.verifyOTP(otp: code);
  }

  late GenralModel registerModel;
  userRegister({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String repeatPassword,
  }) async {
    emit(RegisterLoadingState());
    await Crud.postRequest(USERRegister, {
      "username": name,
      "email": email,
      "phone": phone,
      "password": password,
      "repeatPassword": repeatPassword,
    }).then((value) {
      registerModel = GenralModel.fromJson(value);
      print("Register $value");
      emit(RegisterSuccessState(registerModel: registerModel));
    }).catchError((e) {
      emit(RegisterErrorState());
    });
  }
}
