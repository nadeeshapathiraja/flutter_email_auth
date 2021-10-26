import 'package:email_auth/utils/constants.dart';
import 'package:flutter/material.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Constants.imageAssets("logo.png"),
      width: 120,
      height: 120,
    );
  }
}
