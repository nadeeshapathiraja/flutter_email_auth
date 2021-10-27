// ignore_for_file: non_constant_identifier_names

import 'package:email_auth/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    this.Obsecure = false,
    required this.controller,
  }) : super(key: key);

  final bool Obsecure;
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: TextField(
        obscureText: Obsecure,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: kWhite,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: kGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: kRed),
          ),
        ),
      ),
    );
  }
}
