import 'package:asps/businessLogic/RegisterCubit/register_cubit.dart';
import 'package:asps/businessLogic/RegisterCubit/register_states.dart';
import 'package:asps/shared/component/component.dart';
import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaceCaptureScreen extends StatefulWidget {
  const FaceCaptureScreen({super.key});

  @override
  State<FaceCaptureScreen> createState() => _FaceCaptureScreenState();
}

class _FaceCaptureScreenState extends State<FaceCaptureScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          BlocBuilder<RegisterCubit, RegisterStates>(builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              
            ],
          ),
        );
      }),
    );
  }
}


// SmartFaceCamera(
//             onCapture: (image) {
//               if (image != null) {
//                 RegisterCubit.get(context).uploadImage(img: image);
//                 if (state is UPloadImageSuccessState) {
//                   showToast(message: "success", state: ToastState.sucess);
//                 }
//               }
//             },
//             imageResolution: ImageResolution.veryHigh,
//             message: "Please look at the camera and hold still",
//             messageStyle: const TextStyle(color: Colors.white),
//             defaultCameraLens: CameraLens.front,
//           ),
//         );