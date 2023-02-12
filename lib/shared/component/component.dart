import 'package:flutter/material.dart';

navigateTo(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}

navigateAndKill(BuildContext context, Widget widget) {
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => widget ),(route) => false,);
}
