import 'dart:io';
import 'package:asps/businessLogic/VisitorCubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class VisitorCubit extends Cubit<VisitorStates> {
  VisitorCubit() : super(VisitorInitState());

  static VisitorCubit get(context) => BlocProvider.of(context);

  var picker = ImagePicker();

  File? identyCardImage;

  Future getIdentyImage() async {
    var pickedImage = await picker.pickImage(
      source: ImageSource.camera,
      
    );
    if (pickedImage != null) {
      identyCardImage = File(pickedImage.path);
    } else {
      print("error when picked Image");
    }
  }

  File? visitorImage;
  Future getVisitorImage() async {
    var pickedImage = await picker.pickImage(source: ImageSource.camera,preferredCameraDevice: CameraDevice.front);
    if (pickedImage != null) {
      visitorImage = File(pickedImage.path);
    } else {
      print("error when picked Image");
    }
  }
}
