import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_auth/components/custom_button.dart';
import 'package:email_auth/components/custom_dialogbox.dart';
import 'package:email_auth/components/custom_text.dart';
import 'package:email_auth/components/custom_textfield.dart';
import 'package:email_auth/components/heding_text.dart';
import 'package:email_auth/components/lable_text.dart';
import 'package:email_auth/components/logo_section.dart';
import 'package:email_auth/controllers/auth_controller.dart';
import 'package:email_auth/frogot_password_screen/frogot_password_screen.dart';
import 'package:email_auth/home_screen/home_screen.dart';
import 'package:email_auth/register_screen/register_screen.dart';
import 'package:email_auth/utils/app_colors.dart';
import 'package:email_auth/utils/constants.dart';
import 'package:email_auth/utils/util_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

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
                          CustomTextField(
                            controller: _email,
                          ),

                          const SizedBox(height: 10),

                          //Input Password
                          const LableText(lable: "Enter Your Password"),
                          const SizedBox(height: 5.0),
                          CustomTextField(
                            Obsecure: true,
                            controller: _password,
                          ),

                          const SizedBox(height: 10.0),

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
                                          utilFunction.navigateTo(context,
                                              const FrogotPasswordScreen());
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
                          const SizedBox(height: 15),
                          //SignIn button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                btnText: "Sign In",
                                ontap: () async {
                                  if (inputValidation()) {
                                    await AuthController().loginUser(
                                        context, _email.text, _password.text);
                                  } else {
                                    DialogBox().dialogbox(
                                      context,
                                      'Please Fill All fields and Check your Email',
                                      'Dialog description here.............',
                                      DialogType.ERROR,
                                      () {},
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
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
                                              context, const RegisterScreen());
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

  bool inputValidation() {
    var isValid = false;
    if (_email.text.isEmpty || _password.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }
}
