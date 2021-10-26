import 'package:email_auth/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HeddingText extends StatelessWidget {
  const HeddingText({
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    Key? key,
  }) : super(key: key);
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
