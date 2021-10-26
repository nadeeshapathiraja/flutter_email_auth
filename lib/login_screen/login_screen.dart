import 'package:email_auth/components/heding_text.dart';
import 'package:email_auth/utils/app_colors.dart';
import 'package:email_auth/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Constants.imageAssets("bg.jpg"),
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: kWhite,
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 200,
            ),
            child: Column(
              children: [
                Image.asset(
                  Constants.imageAssets("logo.png"),
                  width: 120,
                  height: 120,
                ),
                const HeddingText(
                  text: "Login Form",
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
