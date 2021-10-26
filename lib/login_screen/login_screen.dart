import 'package:email_auth/components/custom_textfield.dart';
import 'package:email_auth/components/heding_text.dart';
import 'package:email_auth/components/lable_text.dart';
import 'package:email_auth/components/logo_section.dart';
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
      body: SingleChildScrollView(
        child: Container(
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
            //borderRadius: BorderRadius.circular(20.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.greenAccent,
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
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 150,
              ),
              child: Column(
                children: [
                  const LogoSection(),
                  const HeddingText(
                    text: "Login Form",
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        //Input Email
                        const LableText(lable: "Enter Your Email"),
                        const SizedBox(height: 5.0),
                        const CustomTextField(),
                        SizedBox(height: 10),
                        //Input Password
                        const LableText(lable: "Enter Your Password"),
                        const SizedBox(height: 5.0),
                        const CustomTextField(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
