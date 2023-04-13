// ignore_for_file: avoid_print

import 'dart:io';
import 'package:asps/Data/Models/general_model.dart';
import 'package:asps/businessLogic/RegisterCubit/register_states.dart';
import 'package:asps/shared/network/local/shared_helper.dart';
import 'package:asps/shared/network/remote/crud.dart';
import 'package:asps/shared/network/remote/end_points.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterIntialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  var picker = ImagePicker();

  File? userImage;
  // getUserimageProfile() async {
  //   String? path = await SharedHelper.getData(key: "upath");
  //   if (path != null) {
  //     userImage = File(path);
  //   }
  // }

  Future getUserImage() async {
    var pickedImage = await picker.pickImage(
        source: ImageSource.gallery, preferredCameraDevice: CameraDevice.front);
    if (pickedImage != null) {
      userImage = File(pickedImage.path);
      imgpath = userImage!.path.toString();
      SharedHelper.saveData(key: "upath", value: userImage!.path);
      uploadImage(img: File(pickedImage.path.toString()));
    } else {
      print("error when picked Image");
    }
  }

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
    }).then((value) async {
      registerModel = GenralModel.fromJson(value);
      await getUserImage().then((value) {
        emit(RegisterSuccessState(registerModel: registerModel));
      });
    }).catchError((e) {
      emit(RegisterErrorState());
    });
  }

  late GenralModel imageUploadModel;
  Future uploadImage({required File img}) async {
    emit(UPloadImageLoadingState());
    Crud.postReguestWithFiels(
            UPLOADIMAGE,
            {
              "email": "mohamedhcjdivdjvy@gmail.com",
            },
            img)
        .then((value) {
      imageUploadModel = GenralModel.fromJson(value);
      emit(UPloadImageSuccessState(imageUploadModel: imageUploadModel));
      print("Upload Image $value");
    }).catchError((e) {
      print("upload image error ${e.toString()}");
      emit(UPloadImageErrorState());
    });
  }

  bool isPassword = true;
  bool isConfirmPassword = true;
  IconData suffixIcon1 = Icons.visibility;
  IconData suffixIcon2 = Icons.visibility;

  changeVisibility({bool ispassword = true}) {
    if (ispassword) {
      isPassword = !isPassword;
      suffixIcon1 = isPassword ? Icons.visibility : Icons.visibility_off;
    } else {
      isConfirmPassword = !isConfirmPassword;
      suffixIcon2 = isConfirmPassword ? Icons.visibility : Icons.visibility_off;
    }
    emit(ChanegVisibilityState());
  }
}
