// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class utilFunction {
  //Navigation Function
  static void navigateTo(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

//Go back Function
  static void goBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
