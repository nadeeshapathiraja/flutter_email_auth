import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_auth/components/custom_button.dart';
import 'package:email_auth/components/custom_dialogbox.dart';
import 'package:email_auth/components/custom_textfield.dart';
import 'package:email_auth/components/heding_text.dart';
import 'package:email_auth/components/lable_text.dart';
import 'package:email_auth/components/logo_section.dart';
import 'package:email_auth/controllers/auth_controller.dart';
import 'package:email_auth/login_screen/login_screen.dart';
import 'package:email_auth/utils/app_colors.dart';
import 'package:email_auth/utils/constants.dart';
import 'package:email_auth/utils/util_functions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class FrogotPasswordScreen extends StatefulWidget {
  const FrogotPasswordScreen({Key? key}) : super(key: key);

  @override
  _FrogotPasswordScreenState createState() => _FrogotPasswordScreenState();
}

class _FrogotPasswordScreenState extends State<FrogotPasswordScreen> {
  final _email = TextEditingController();
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
                  vertical: 160,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LogoSection(),
                    const HeddingText(
                      text: "Frogot Your Password",
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

                          SizedBox(height: 25),
                          //SignIn button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                btnText: "Send Email",
                                ontap: () {
                                  if (inputValidation()) {
                                    AuthController().sendPasswordResetEmail(
                                        context, _email.text);
                                  } else {
                                    DialogBox().dialogbox(
                                      context,
                                      'Please Enter your Email',
                                      'Dialog description here.............',
                                      DialogType.ERROR,
                                      () {},
                                    );
                                  }
                                },
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
    if (_email.text.isEmpty) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }
}
