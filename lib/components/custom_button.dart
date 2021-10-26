import 'package:email_auth/components/custom_text.dart';
import 'package:email_auth/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.btnText,
    required this.ontap,
  }) : super(key: key);

  final String btnText;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 200,
        height: 50,
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: TextStyle(
            color: kWhite,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              primaryColor,
              Colors.white,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: kBlack,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
      ),
    );
  }
}
