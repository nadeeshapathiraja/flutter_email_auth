import 'package:animate_do/animate_do.dart';
import 'package:email_auth/components/custom_button.dart';
import 'package:email_auth/components/custom_textfield.dart';
import 'package:email_auth/components/heding_text.dart';
import 'package:email_auth/components/lable_text.dart';
import 'package:email_auth/components/logo_section.dart';
import 'package:email_auth/home_screen/home_screen.dart';
import 'package:email_auth/login_screen/login_screen.dart';
import 'package:email_auth/utils/app_colors.dart';
import 'package:email_auth/utils/constants.dart';
import 'package:email_auth/utils/util_functions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              borderRadius: BorderRadius.circular(50.0),
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
                  vertical: 60,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LogoSection(),
                    const HeddingText(
                      text: "Register Form",
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          //Input Name
                          const LableText(lable: "Enter Your Name"),
                          const SizedBox(height: 5.0),
                          const CustomTextField(),
                          const SizedBox(height: 10),

                          //Input Phone
                          const LableText(lable: "Enter Your Phone Number"),
                          const SizedBox(height: 5.0),
                          const CustomTextField(),
                          const SizedBox(height: 10),

                          //Input Email
                          const LableText(lable: "Enter Your Email"),
                          const SizedBox(height: 5.0),
                          const CustomTextField(),
                          const SizedBox(height: 10),

                          //Input Password
                          const LableText(lable: "Enter Your Password"),
                          const SizedBox(height: 5.0),
                          const CustomTextField(Obsecure: true),
                          SizedBox(height: 15.0),

                          //SignIn button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                btnText: "Sign Up",
                                ontap: () {},
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
                                      text: "Already have an Account..",
                                      style: TextStyle(
                                        color: kGrey,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "LogIn",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          utilFunction.navigateTo(
                                              context, LoginScreen());
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
