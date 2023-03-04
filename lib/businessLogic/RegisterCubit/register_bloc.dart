import 'dart:io';
import 'package:asps/businessLogic/RegisterCubit/register_states.dart';
import 'package:asps/shared/network/remote/crud.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterIntialState());

  RegisterCubit get(context) => BlocProvider.of(context);

  var picker = ImagePicker();

  File? userImage;

  getUserImage() async {
    var pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      userImage = File(pickedImage.path);
    } else {
      print("error when picked Image");
    }
  }

  EmailOTP myauth = EmailOTP();
  void sendOTP() async {
    myauth.setConfig(
        appEmail: "me@rohitchouhan.com",
        appName: "ASPS Email OTP",
        userEmail: "",
        otpLength: 4,
        otpType: OTPType.digitsOnly);

    await myauth.sendOTP();
  }

  void verifyOtp() async {
    int inputOTP = 4430;
    await myauth.verifyOTP(otp: inputOTP);
  }

  userRegister() async {
    emit(RegisterLoadingState());
    await Crud.postRequest("", {}).then((value) {
      emit(RegisterSuccessState());
    }).catchError((e) {
      emit(RegisterErrorState());
    });
  }
}
