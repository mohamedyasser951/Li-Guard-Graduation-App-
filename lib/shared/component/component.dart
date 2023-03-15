import 'package:asps/screens/login/login_screen.dart';
import 'package:asps/screens/login_or_register/login_or_register.dart';
import 'package:asps/shared/network/local/shared_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

navigateTo(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}

navigateAndKill(BuildContext context, Widget widget) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => widget),
    (route) => false,
  );
}

logOut(BuildContext context) {
  SharedHelper.removeData(key: 'email').then((value) {
    SharedHelper.removeData(key: 'id').then((value) {
      if (value) {
        navigateAndKill(context, const LoginOrRegister());
      }
    });
  });
}

enum ToastState {
  sucess,
  warning,
  error,
}

showToast({
  required String message,
  required ToastState state,
}) {
  Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: changeToastColor(state: state),
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}

changeToastColor({required ToastState state}) {
  Color toastColor;
  switch (state) {
    case ToastState.sucess:
      toastColor = Colors.green;
      break;
    case ToastState.error:
      toastColor = Colors.red;
      break;
    case ToastState.warning:
      toastColor = Colors.amber;
      break;
  }
  return toastColor;
}
