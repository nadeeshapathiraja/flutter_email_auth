import 'package:animate_do/animate_do.dart';
import 'package:email_auth/components/custom_button.dart';
import 'package:email_auth/components/custom_text.dart';
import 'package:email_auth/components/custom_textfield.dart';
import 'package:email_auth/components/heding_text.dart';
import 'package:email_auth/components/lable_text.dart';
import 'package:email_auth/components/logo_section.dart';
import 'package:email_auth/frogot_password_screen/frogot_password_screen.dart';
import 'package:email_auth/home_screen/home_screen.dart';
import 'package:email_auth/register_screen/register_screen.dart';
import 'package:email_auth/utils/app_colors.dart';
import 'package:email_auth/utils/constants.dart';
import 'package:email_auth/utils/util_functions.dart';
import 'package:flutter/gestures.dart';
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
          child: SlideInLeft(
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
                  vertical: 130,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          const CustomTextField(Obsecure: true),

                          SizedBox(height: 10.0),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Frogot Your Password.. ",
                                      style: TextStyle(
                                        color: kGrey,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Reset Password",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          utilFunction.navigateTo(
                                              context, FrogotPasswordScreen());
                                        },
                                      style: const TextStyle(
                                        color: kBlack,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          //SignIn button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                btnText: "Sign In",
                                ontap: () {
                                  utilFunction.navigateTo(
                                      context, HomeScreen());
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Don't have an Account..",
                                      style: TextStyle(
                                        color: kGrey,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Register",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          utilFunction.navigateTo(
                                              context, RegisterScreen());
                                        },
                                      style: const TextStyle(
                                        color: kBlack,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
