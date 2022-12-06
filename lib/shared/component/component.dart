import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

navigateTo(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}
