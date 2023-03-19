import 'dart:io';
import 'package:asps/Data/Models/general_model.dart';
import 'package:asps/businessLogic/VisitorCubit/states.dart';
import 'package:asps/shared/network/remote/crud.dart';
import 'package:asps/shared/network/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
}
