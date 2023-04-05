// ignore_for_file: avoid_print

import 'dart:io';
import 'package:asps/Data/Models/general_model.dart';
import 'package:asps/businessLogic/VisitorCubit/states.dart';
import 'package:asps/shared/network/remote/crud.dart';
import 'package:asps/shared/network/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart' as sender;
import 'package:image_picker/image_picker.dart';

class VisitorCubit extends Cubit<VisitorStates> {
  VisitorCubit() : super(VisitorInitState());

  static VisitorCubit get(context) => BlocProvider.of(context);

  var picker = ImagePicker();

  File? identyCardImage;

  Future getIdentyImage() async {
    var pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      identyCardImage = File(pickedImage.path);
      print("identyCardImage= $identyCardImage");
      await uploadVisitorImage(img: identyCardImage!);
    } else {
      print("error when picked Image");
    }
  }

  File? visitorImage;
  Future getVisitorImage() async {
    var pickedImage = await picker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
    if (pickedImage != null) {
      visitorImage = File(pickedImage.path);
      uploadVisitorImage(img: visitorImage!);
    } else {
      print("error when picked Image");
    }
  }

  late GenralModel imageUploadModel;

  uploadVisitorImage({required File img}) async {
    Crud.postReguestWithFiels(
            UPLOADIMAGE,
            {
              "email": "omarahmed@gmail.com",
            },
            img)
        .then((value) {
      print("00000000000000$value");
      imageUploadModel = GenralModel.fromJson(value);
      emit(VisitorUplaodImageSuceessState());
    }).catchError((error) {
      print(error.toString());
      emit(VisitorUplaodImageErrorState());
    });
  }

  GenralModel? visitorModel;
  Future visitorRegister({
    required String email,
    required String name,
    required String phone,
  }) async {
    emit(VisitorRegisterLoadingState());
    await Crud.postRequest(VISITOR_REGISTER, {
      "email": email,
      "username": name,
      "phone": phone,
      "password": "1234",
      "repeatPassword": "1234"
    }).then((value) {
      visitorModel = GenralModel.fromJson(value);
      print(value);
      emit(VisitorRegisterSuccessState(model: visitorModel!));
    }).catchError((e) {
      print(e.toString());
      emit(VisitorRegisterErrorState());
    });
  }

  //Send Mail

  Future sendMail({
    required String to,
    required String subject,
    required String body,
  }) async {
    final sender.Email email = sender.Email(
      body: "12345",
      subject: 'ASPS Invite Code',
      recipients: ["mohamedhcjdivdjvy@gmail.com"],
      isHTML: false,
    );

    await sender.FlutterEmailSender.send(email);
  }
}
