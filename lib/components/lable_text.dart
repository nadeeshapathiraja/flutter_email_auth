import 'package:email_auth/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LableText extends StatelessWidget {
  const LableText({
    Key? key,
    required this.lable,
  }) : super(key: key);
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Text(
      lable,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: kBlack,
      ),
    );
  }
}
