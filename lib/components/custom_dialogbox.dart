import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_auth/login_screen/login_screen.dart';
import 'package:email_auth/utils/app_colors.dart';

import 'package:email_auth/utils/util_functions.dart';
import 'package:flutter/cupertino.dart';

class DialogBox {
  Future<dynamic> dialogbox(BuildContext context, String title, String desc,
      DialogType type, Function() btnPress) async {
    return AwesomeDialog(
            context: context,
            dialogType: type,
            animType: AnimType.BOTTOMSLIDE,
            title: title,
            desc: desc,
            btnOkOnPress: btnPress,
            btnOkColor: kBlue)
        .show();
  }
}
