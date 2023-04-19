// ignore_for_file: avoid_print

import 'dart:io';
import 'package:asps/Data/Models/general_model.dart';
import 'package:asps/businessLogic/VisitorCubit/states.dart';
import 'package:asps/shared/network/local/shared_helper.dart';
import 'package:asps/shared/network/remote/crud.dart';
import 'package:asps/shared/network/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

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

  // getVisitorimageProfile() async {
  //   String path = await SharedHelper.getData(key: "vpath");
  //   visitorImage = File(path);
  // }

  File? visitorImage;

  Future getVisitorImage() async {
    var pickedImage = await picker.pickImage(
        source: ImageSource.gallery, preferredCameraDevice: CameraDevice.front);
    if (pickedImage != null) {
      visitorImage = File(pickedImage.path);
        imgpath = visitorImage!.path.toString();
      SharedHelper.saveData(key: "vpath", value: visitorImage!.path.toString());

      uploadVisitorImage(img: visitorImage!);
    } else {
      print("error when picked Image");
    }
  }

  late GenralModel imageUploadModel;

  Future uploadVisitorImage({required File img}) async {
    Crud.postReguestWithFiels(
            UPLOADIMAGE,
            {
              "email": EMAIL,
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

  Future sendMail({
    required String recipients,
    required int code,
  }) async {
    String username = 'mohamedhcjdivdjvy@gmail.com';
    String password = 'gfxroupwqkawcbqh';

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, password)
      ..recipients.add(recipients)
      ..bccRecipients.add(Address(username.toString()))
      ..subject = 'Li Guard'
      ..text = 'Your Invite Code.'
      ..html = "<h3>Here is your Invite Code $code</h3>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: $sendReport');
    } on MailerException catch (e) {
      print('Message not sent.');
      print(e.message);
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
