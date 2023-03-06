import 'package:asps/shared/component/component.dart';
import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';

class FaceCaptureScreen extends StatelessWidget {
  const FaceCaptureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SmartFaceCamera(
          onCapture: (image) {
            if (image != null) {
              // Navigator.pop(context);
              showToast(message: "success", state: ToastState.sucess);
            }
          },
          imageResolution: ImageResolution.veryHigh,
          message: "Please look at the camera and hold still",
          messageStyle: const TextStyle(color: Colors.white),
          defaultCameraLens: CameraLens.front,
        ),
      ),
    );
  }
}
